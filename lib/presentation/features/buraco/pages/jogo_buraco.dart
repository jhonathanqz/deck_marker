import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/alert_nova_partida.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/alert_nova_pontuacao.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/alert_novo_jogo.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/alert_winner.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/card_time1.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/card_time2.dart';
import 'package:deck_marker/presentation/features/settings/mobx/settings.store.dart';
import 'package:deck_marker/presentation/shared/helpers/dialog_helper.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/widgets/button/button_primary.dart';
import 'package:deck_marker/presentation/shared/widgets/scaffold/scaffold_primary.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class JogoBuraco extends StatefulWidget {
  const JogoBuraco({Key? key}) : super(key: key);
  @override
  _JogoBuracoState createState() => _JogoBuracoState();
}

class _JogoBuracoState extends State<JogoBuraco> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (_) {
          final ijBuracoStore = sl<BuracoStore>();
          final ss = sl<SettingsStore>();
          return ScaffoldPrimary(
            title: 'Jogo',
            isLoading: ss.isLoading,
            isOcultAppBar: true,
            child: Padding(
              padding: AppEdgeInsets.minAll,
              child: Column(
                children: [
                  Padding(
                    padding: AppEdgeInsets.minAll,
                    child: Row(
                      children: [
                        Expanded(
                          child: ButtonPrimary(
                            onTap: () => showNovaPartida(
                              context,
                              ijBuracoStore,
                              ss,
                            ),
                            title: 'Nova Partida',
                            colorButton: AppColors.black,
                            colorText: AppColors.white,
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 35,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: ButtonPrimary(
                            onTap: () => showNovoJogo(
                              context,
                              ijBuracoStore,
                              ss,
                            ),
                            title: 'Novo Jogo',
                            colorButton: AppColors.black,
                            colorText: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Column(
                          children: const [
                            CardTime1(),
                            CardTime2(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppEdgeInsets.sdAll,
                    child: ButtonPrimary(
                      onTap: () => _novaPontuacao(ijBuracoStore),
                      title: 'Nova Pontuação',
                      colorButton: AppColors.black,
                      colorText: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _novaPontuacao(BuracoStore ijBuracoStore) {
    if (ijBuracoStore.time1Venceu == false &&
        ijBuracoStore.time2Venceu == false) {
      showNovaPontuacao(
        context,
        ijBuracoStore,
      );
      //showWinner();
    } else {
      showWinner();
    }
  }

  void showNovoJogo(
    context,
    ijBuracoStore,
    ss,
  ) {
    DialogHelper.open(
      context: context,
      content: AlertNovoJogo(
        function: () async {
          ijBuracoStore.novoJogo();
          await ss.setScoreBuraco(
            context: context,
            scoreTeam1: '0',
            scoreTeam2: '0',
            callbackSucess: () {},
          );
          coolNavigate.goBack();
        },
      ),
    );
  }

  void showNovaPartida(context, ijBuracoStore, ss) {
    DialogHelper.open(
      context: context,
      content: AlertNovaPartida(
        function: () async {
          coolNavigate.goBack();
          await ss.wipeInitials(context: context);
          ijBuracoStore.clearFieldsBuraco();
          coolNavigate.removeUntil(NameRoute.home);
          coolNavigate.navigateTo(NameRoute.escolhaJogoBuraco);
        },
      ),
    );
  }

  void showNovaPontuacao(context, ijBuracoStore) {
    DialogHelper.open(
      context: context,
      content: AlertNovaPontuacao(
        function: () {
          ijBuracoStore.clearFieldsPontuacao();
          coolNavigate.removeUntil(NameRoute.pontuacaoBuraco);
        },
      ),
    );
  }

  void showWinner() {
    DialogHelper.open(
      context: context,
      content: const AlertWinner(),
    );
  }
}
