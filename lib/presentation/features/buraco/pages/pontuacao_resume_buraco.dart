import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/alert_winner.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/form_resume_score_team1.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/form_resume_score_team2.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/form_title_resume_score.dart';
import 'package:deck_marker/presentation/features/settings/mobx/settings.store.dart';
import 'package:deck_marker/presentation/shared/helpers/dialog_helper.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:deck_marker/presentation/shared/widgets/button/button_primary.dart';
import 'package:deck_marker/presentation/shared/widgets/scaffold/scaffold_primary.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PontuacaoResumeBuraco extends StatelessWidget {
  const PontuacaoResumeBuraco({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final ijBuracoStore = sl<BuracoStore>();
        final ss = sl<SettingsStore>();
        return ScaffoldPrimary(
          isLoading: ss.isLoading,
          title: 'Resumo de pontos',
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: AppEdgeInsets.sdAll,
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.black,
                          child: Center(
                            child: Text(
                              'Pontuação Time 1',
                              style: AppTextStyles.heading.copyWith(
                                color: AppColors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                  color: AppColors.blue300,
                                ),
                                child: const FormTitleResumeScore(),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: AppColors.blue200,
                                width: MediaQuery.of(context).size.width / 2,
                                child: FormResumeScoreTeam1(
                                  ijBuracoStore: ijBuracoStore,
                                  canastraLimpaTime1: int.tryParse(
                                          ijBuracoStore.canastraLimpaTime1)! *
                                      200,
                                  canastraSujaTime1: int.tryParse(
                                          ijBuracoStore.canastraSujaTime1)! *
                                      100,
                                  pontosMesaTime1: int.tryParse(
                                      ijBuracoStore.pontuacaoCartasTime1)!,
                                  pontosNegativosTime1: int.tryParse(
                                      ijBuracoStore.pontuacaoNegativaTime1)!,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //******************************************************************************************************************** */
                        // ****** resumo de pontuação do time 2 ****** //
                        //******************************************************************************************************************** */
                        Container(
                          padding: AppEdgeInsets.sdAll,
                          width: MediaQuery.of(context).size.width,
                          //height: 30,
                          color: AppColors.black,
                          child: Center(
                            child: Text(
                              'Pontuação Time 2',
                              style: AppTextStyles.heading.copyWith(
                                color: AppColors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                  color: AppColors.blue300,
                                ),
                                child: const FormTitleResumeScore(),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: AppColors.blue200,
                                width: MediaQuery.of(context).size.width / 2,
                                child: FormResumeScoreTeam2(
                                  ijBuracoStore: ijBuracoStore,
                                  canastraLimpaTime2: int.tryParse(
                                          ijBuracoStore.canastraLimpaTime2)! *
                                      200,
                                  canastraSujaTime2: int.tryParse(
                                          ijBuracoStore.canastraSujaTime2)! *
                                      100,
                                  pontosMesaTime2: int.tryParse(
                                      ijBuracoStore.pontuacaoCartasTime2)!,
                                  pontosNegativosTime2: int.tryParse(
                                      ijBuracoStore.pontuacaoNegativaTime2)!,
                                ),
                              ),
                            ),
                          ],
                        ),
                        AppSpacing.md,
                        Padding(
                          padding: AppEdgeInsets.sdAll,
                          child: ButtonPrimary(
                            onTap: () => _finishScore(
                              context,
                              ijBuracoStore,
                              ss,
                            ),
                            title: 'Finalizar',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _finishScore(
    context,
    ijBuracoStore,
    ss,
  ) async {
    ijBuracoStore.finalizarPontuacao();
    await ss.setScoreBuraco(
      context: context,
      scoreTeam1: ijBuracoStore.pontosTime1.toString(),
      scoreTeam2: ijBuracoStore.pontosTime2.toString(),
      callbackSucess: () {},
    );
    coolNavigate.removeUntil(NameRoute.jogoBuraco);
    ijBuracoStore.time1Venceu == true || ijBuracoStore.time2Venceu == true
        ? showWinner(context)
        // ignore: unnecessary_statements
        : null;
  }

  void showWinner(context) {
    DialogHelper.open(
      context: context,
      content: AlertWinner(),
    );
  }
}
