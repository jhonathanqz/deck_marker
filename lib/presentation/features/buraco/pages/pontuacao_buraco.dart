import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/presentation/features/buraco/form/form_pontuacao/form_pontuacao.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/alert_winner.dart';
import 'package:deck_marker/presentation/shared/helpers/dialog_helper.dart';
import 'package:deck_marker/presentation/shared/helpers/snack_helper.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/widgets/button/button_primary.dart';
import 'package:deck_marker/presentation/shared/widgets/scaffold/scaffold_primary.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PontuacaoBuraco extends StatelessWidget {
  PontuacaoBuraco({Key? key}) : super(key: key);

  final ijBuracoStore = sl<BuracoStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ScaffoldPrimary(
          title: 'Nova pontuação',
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: AppEdgeInsets.hsd,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const FormPontuacao(),
                        AppSpacing.xl,
                        ButtonPrimary(
                          onTap: () {
                            if (ijBuracoStore.isFormPontuacaoValid) {
                              ijBuracoStore.calcularRodada();
                              coolNavigate
                                  .navigateTo(NameRoute.resumoPontuacaoBuraco);
                            } else {
                              _onFailForm(context);
                            }
                          },
                          title: 'Finalizar pontuação',
                        ),
                        AppSpacing.xl,
                        AppSpacing.xl,
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _onFailForm(BuildContext context) {
    SnackHelper.showSnackInformation(
      'Existe campos em branco, por favor verifique!',
      Colors.redAccent[700]!,
      context,
    );
  }

  void showWinner(context) {
    DialogHelper.open(
      context: context,
      content: const AlertWinner(),
    );
  }
}
