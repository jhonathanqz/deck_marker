import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/alert_nova_partida.dart';
import 'package:deck_marker/presentation/features/settings/mobx/settings.store.dart';
import 'package:deck_marker/presentation/features/truco/mobx/truco.store.dart';
import 'package:deck_marker/presentation/features/truco/widgets/alert_novo_jogo_truco.dart';
import 'package:deck_marker/presentation/features/truco/widgets/row_button_truco.dart';
import 'package:deck_marker/presentation/features/truco/widgets/row_buttons.dart';
import 'package:deck_marker/presentation/shared/helpers/dialog_helper.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_images.dart';
import 'package:deck_marker/presentation/shared/style/app_input_border.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:deck_marker/utils/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NewJogoTruco extends StatefulWidget {
  const NewJogoTruco({Key? key}) : super(key: key);

  @override
  _NewJogoTrucoState createState() => _NewJogoTrucoState();
}

class _NewJogoTrucoState extends State<NewJogoTruco> {
  final ts = sl<TrucoStore>();
  final ss = sl<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.background,
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: AppEdgeInsets.sdAll,
                    child: Column(
                      children: [
                        RowButtons(
                          desfazer: () => _desfazer(),
                          novoJogo: () => _novoJogo(),
                          novaPartida: () => _novaPartida(),
                        ),
                        AppSpacing.sm,
                        Expanded(
                          child: Container(
                            decoration: AppInputBorder.borderRadius,
                            padding: AppEdgeInsets.sdAll,
                            width: Layout.getSize(context).width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Text(
                                    ts.fullPlayersTeam1,
                                    style: AppTextStyles.headingBold,
                                  ),
                                ),
                                AppSpacing.md,
                                Center(
                                  child: Text(
                                    '${ts.time1}',
                                    style: AppTextStyles.headingBold.copyWith(
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                                AppSpacing.md,
                                Center(
                                  child: SizedBox(
                                    height: 30,
                                    child: Image.asset(
                                      AppImages.cartas,
                                    ),
                                  ),
                                ),
                                AppSpacing.md,
                                RowButtonTruco(
                                  increase1: () =>
                                      _increaseScore1(teamNumber: 1),
                                  increase3: () =>
                                      _increaseScore3(teamNumber: 1),
                                  increase6: () =>
                                      _increaseScore6(teamNumber: 1),
                                  increase9: () =>
                                      _increaseScore9(teamNumber: 1),
                                  increase12: () =>
                                      _increaseScore12(teamNumber: 1),
                                ),
                                AppSpacing.md,
                                Visibility(
                                  visible: true,
                                  child: Center(
                                    child: Text(
                                      ts.messageTime1,
                                      style: AppTextStyles.headingBold.copyWith(
                                        color: ts.time2 >= 12
                                            ? AppColors.red700
                                            : AppColors.greenInformation,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppSpacing.sm,
                        Expanded(
                          child: Container(
                            decoration: AppInputBorder.borderRadius,
                            padding: AppEdgeInsets.sdAll,
                            width: Layout.getSize(context).width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Text(
                                    ts.fullPlayersTeam2,
                                    style: AppTextStyles.headingBold,
                                  ),
                                ),
                                AppSpacing.md,
                                Center(
                                  child: Text(
                                    '${ts.time2}',
                                    style: AppTextStyles.headingBold.copyWith(
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                                AppSpacing.md,
                                Center(
                                  child: SizedBox(
                                    height: 30,
                                    child: Image.asset(
                                      AppImages.cartas,
                                    ),
                                  ),
                                ),
                                AppSpacing.md,
                                RowButtonTruco(
                                  increase1: () =>
                                      _increaseScore1(teamNumber: 2),
                                  increase3: () =>
                                      _increaseScore3(teamNumber: 2),
                                  increase6: () =>
                                      _increaseScore6(teamNumber: 2),
                                  increase9: () =>
                                      _increaseScore9(teamNumber: 2),
                                  increase12: () =>
                                      _increaseScore12(teamNumber: 2),
                                ),
                                AppSpacing.md,
                                Visibility(
                                  visible: true,
                                  child: Center(
                                    child: Text(
                                      ts.messageTime2,
                                      style: AppTextStyles.headingBold.copyWith(
                                        color: ts.time1 >= 12
                                            ? AppColors.red700
                                            : AppColors.greenInformation,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _increaseScore1({
    required int teamNumber,
  }) async {
    if (teamNumber == 1) {
      if (ts.time1 >= 0 && ts.time1 <= 11 && ts.time2 < 12) {
        _changeTimeum(1);
        ts.a = 1;
        ts.b = 0;
        _mensagemTime1();
      }

      if (ts.time2 >= 12) {
        ts.messageTime1 = "Por favor, inicie um novo Jogo!";
      }
      await ss.setScoreTruco(
        context: context,
        scoreTeam1: ts.time1.toString(),
        scoreTeam2: ts.time2.toString(),
        callbackSucess: () {},
      );
      return;
    }
    if (teamNumber == 2) {
      if (ts.time2 >= 0 && ts.time2 <= 11 && ts.time1 < 12) {
        _changeTimedois(1);
        ts.a = 0;
        ts.b = 1;

        _mensagemTime2();
      }
      await ss.setScoreTruco(
        context: context,
        scoreTeam1: ts.time1.toString(),
        scoreTeam2: ts.time2.toString(),
        callbackSucess: () {},
      );
      return;
    }
  }

  void _increaseScore3({
    required int teamNumber,
  }) async {
    if (teamNumber == 1) {
      if (ts.time1 >= 0 && ts.time1 <= 11 && ts.time2 < 12) {
        _changeTimeum(3);
        ts.a = 3;
        ts.b = 0;
        _mensagemTime1();
      }
      await ss.setScoreTruco(
        context: context,
        scoreTeam1: ts.time1.toString(),
        scoreTeam2: ts.time2.toString(),
        callbackSucess: () {},
      );
      return;
    }
    if (teamNumber == 2) {
      if (ts.time2 >= 0 && ts.time2 <= 11 && ts.time1 < 12) {
        _changeTimedois(3);
        ts.a = 0;
        ts.b = 3;

        _mensagemTime2();
      }
      await ss.setScoreTruco(
        context: context,
        scoreTeam1: ts.time1.toString(),
        scoreTeam2: ts.time2.toString(),
        callbackSucess: () {},
      );
      return;
    }
  }

  void _increaseScore6({
    required int teamNumber,
  }) async {
    if (teamNumber == 1) {
      if (ts.time1 >= 0 && ts.time1 <= 11 && ts.time2 < 12) {
        _changeTimeum(6);
        ts.a = 6;
        ts.b = 0;
        _mensagemTime1();
      }
      await ss.setScoreTruco(
        context: context,
        scoreTeam1: ts.time1.toString(),
        scoreTeam2: ts.time2.toString(),
        callbackSucess: () {},
      );
      return;
    }
    if (teamNumber == 2) {
      if (ts.time2 >= 0 && ts.time2 <= 11 && ts.time1 < 12) {
        _changeTimedois(6);
        ts.a = 0;
        ts.b = 6;

        _mensagemTime2();
      }
      await ss.setScoreTruco(
        context: context,
        scoreTeam1: ts.time1.toString(),
        scoreTeam2: ts.time2.toString(),
        callbackSucess: () {},
      );
      return;
    }
  }

  void _increaseScore9({
    required int teamNumber,
  }) async {
    if (teamNumber == 1) {
      if (ts.time1 >= 0 && ts.time1 <= 11 && ts.time2 < 12) {
        _changeTimeum(9);
        ts.a = 9;
        ts.b = 0;
        _mensagemTime1();
      }
      await ss.setScoreTruco(
        context: context,
        scoreTeam1: ts.time1.toString(),
        scoreTeam2: ts.time2.toString(),
        callbackSucess: () {},
      );
      return;
    }
    if (teamNumber == 2) {
      if (ts.time2 >= 0 && ts.time2 <= 11 && ts.time1 < 12) {
        _changeTimedois(9);
        ts.a = 0;
        ts.b = 9;

        _mensagemTime2();
      }
      await ss.setScoreTruco(
        context: context,
        scoreTeam1: ts.time1.toString(),
        scoreTeam2: ts.time2.toString(),
        callbackSucess: () {},
      );
      return;
    }
  }

  void _increaseScore12({
    required int teamNumber,
  }) async {
    if (teamNumber == 1) {
      if (ts.time1 >= 0 && ts.time1 <= 11 && ts.time2 < 12) {
        _changeTimeum(12);
        ts.a = 12;
        ts.b = 0;
        _mensagemTime1();
      }
      await ss.setScoreTruco(
        context: context,
        scoreTeam1: ts.time1.toString(),
        scoreTeam2: ts.time2.toString(),
        callbackSucess: () {},
      );
      return;
    }
    if (teamNumber == 2) {
      if (ts.time2 >= 0 && ts.time2 <= 11 && ts.time1 < 12) {
        _changeTimedois(12);
        ts.a = 0;
        ts.b = 12;

        _mensagemTime2();
      }
      await ss.setScoreTruco(
        context: context,
        scoreTeam1: ts.time1.toString(),
        scoreTeam2: ts.time2.toString(),
        callbackSucess: () {},
      );
      return;
    }
  }

  void _novoJogo() {
    DialogHelper.open(
      context: context,
      content: AlertNovoJogoTruco(
        function: () async {
          ts.novoJogo();
          await ss.setScoreTruco(
            context: context,
            scoreTeam1: ts.time1.toString(),
            scoreTeam2: ts.time2.toString(),
            callbackSucess: () {},
          );
          coolNavigate.goBack();
        },
      ),
    );
  }

  void _novaPartida() {
    DialogHelper.open(
      context: context,
      content: AlertNovaPartida(
        function: () async {
          ts.deleteAll();
          coolNavigate.goBack();
          coolNavigate.removeUntil(NameRoute.escolhaJogoTruco);
          await ss.wipeInitials(context: context);
        },
      ),
    );
  }

  void _desfazer() async {
    ts.reverse();
    _mensagemTime1();
    _mensagemTime2();
    await ss.setScoreTruco(
      context: context,
      scoreTeam1: ts.time1.toString(),
      scoreTeam2: ts.time2.toString(),
      callbackSucess: () {},
    );
  }

  void _changeTimeum(int delta) {
    setState(() {
      ts.time1 += delta;
    });
  }

  void _mensagemTime1() {
    setState(() {
      if (ts.time1 < 0) {
        ts.messageTime1 = "Começou perdendo! ???";
      } else if (ts.time1 < 11) {
        ts.messageTime1 = "Bom jogo!";
      } else if (ts.time1 == 11) {
        ts.messageTime1 = "Mão de 11. Boa Sorte!";
      } else if (ts.time1 >= 12) {
        ts.messageTime1 = "Parabéns, vocês ganharam o Jogo!!!";
        ts.messageTime2 = "Vocês perderam!";
      } else if (ts.time2 >= 12) {
        ts.messageTime1 = "Por favor, inicie um novo Jogo!";
      } else {
        ts.messageTime1 = "Parabéns, vocês ganharam o Jogo!!!";
      }
    });
  }

  void _changeTimedois(int delta) {
    setState(() {
      ts.time2 += delta;
    });
  }

  void _mensagemTime2() {
    setState(() {
      if (ts.time2 < 0) {
        ts.messageTime2 = "Começou perdendo! ???";
      } else if (ts.time2 < 11) {
        ts.messageTime2 = "Bom Jogo!";
      } else if (ts.time2 == 11) {
        ts.messageTime2 = "Mão de 11. Boa Sorte!";
      } else if (ts.time2 >= 12) {
        ts.messageTime2 = "Parabéns, vocês ganharam o Jogo!!!";
        ts.messageTime1 = "Vocês perderam!";
      } else if (ts.time1 >= 12) {
        ts.messageTime2 = "Por favor, inicie um novo jogo!";
      } else {
        ts.messageTime2 = "Parabéns, vocês ganharam o Jogo!!!";
      }
    });
  }
}
