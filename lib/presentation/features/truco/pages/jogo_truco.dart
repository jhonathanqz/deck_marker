import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/alert_nova_partida.dart';
import 'package:deck_marker/presentation/features/truco/mobx/truco.store.dart';
import 'package:deck_marker/presentation/features/truco/widgets/alert_novo_jogo_truco.dart';
import 'package:deck_marker/presentation/shared/helpers/dialog_helper.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_input_border.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:deck_marker/presentation/shared/widgets/button/button_primary.dart';
import 'package:deck_marker/presentation/shared/widgets/button/button_value.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeJogo extends StatefulWidget {
  const HomeJogo({Key? key}) : super(key: key);

  @override
  _HomeJogoState createState() => _HomeJogoState();
}

class _HomeJogoState extends State<HomeJogo> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final ij = sl<TrucoStore>();

  void _changeTimeum(int delta) {
    setState(() {
      ij.time1 += delta;
    });
  }

  void _mensagemTime1() {
    setState(() {
      if (ij.time1 < 0) {
        ij.messageTime1 = "Começou perdendo! ???";
      } else if (ij.time1 < 11) {
        ij.messageTime1 = "Bom jogo!";
      } else if (ij.time1 == 11) {
        ij.messageTime1 = "Mão de 11. Boa Sorte!";
      } else if (ij.time1 >= 12) {
        ij.messageTime1 = "Parabéns, vocês ganharam o Jogo!!!";
        ij.messageTime2 = "Vocês perderam!";
      } else if (ij.time2 >= 12) {
        ij.messageTime1 = "Por favor, inicie um novo Jogo!";
      } else {
        ij.messageTime1 = "Parabéns, vocês ganharam o Jogo!!!";
      }
    });
  }

  void _changeTimedois(int delta) {
    setState(() {
      ij.time2 += delta;
    });
  }

  void _mensagemTime2() {
    setState(() {
      if (ij.time2 < 0) {
        ij.messageTime2 = "Começou perdendo! ???";
      } else if (ij.time2 < 11) {
        ij.messageTime2 = "Bom Jogo!";
      } else if (ij.time2 == 11) {
        ij.messageTime2 = "Mão de 11. Boa Sorte!";
      } else if (ij.time2 >= 12) {
        ij.messageTime2 = "Parabéns, vocês ganharam o Jogo!!!";
        ij.messageTime1 = "Vocês perderam!";
      } else if (ij.time1 >= 12) {
        ij.messageTime2 = "Por favor, inicie um novo jogo!";
      } else {
        ij.messageTime2 = "Parabéns, vocês ganharam o Jogo!!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Observer(
        builder: (_) {
          return Stack(
            children: <Widget>[
              SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey2,
                    image: const DecorationImage(
                      image: AssetImage(
                        "images/cartas1.png",
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 25,
                              right: 20,
                            ),
                            child: SizedBox(
                              height: 40.0,
                              width: 150,
                              child: ButtonPrimary(
                                onTap: () => showNovaPartida(context),
                                title: 'Nova Partida',
                                colorButton: AppColors.black,
                                colorText: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 10,
                              right: 20,
                            ),
                            child: SizedBox(
                              height: 40.0,
                              width: 150,
                              child: ButtonPrimary(
                                onTap: () => showNovoJogoTruco(context),
                                title: 'Nova Jogo',
                                colorButton: AppColors.black,
                                colorText: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 10,
                              right: 20,
                            ),
                            child: Container(
                              height: 40.0,
                              width: 150,
                              decoration: AppInputBorder.borderRadius.copyWith(
                                color: AppColors.black,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  ij.reverse();
                                  _mensagemTime1();
                                  _mensagemTime2();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.history,
                                      color: Colors.yellowAccent,
                                      size: 20,
                                    ),
                                    AppSpacing.smW,
                                    Text(
                                      "Desfazer",
                                      style: AppTextStyles.title.copyWith(
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ij.forPlayers == true
                      ? Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 5,
                            bottom: 5,
                          ),
                          margin: AppEdgeInsets.hmd,
                          width: MediaQuery.of(context).size.width,
                          decoration: AppInputBorder.borderRadius.copyWith(
                            color: AppColors.grey800,
                          ),
                          child: Center(
                            child: Text(
                              "${ij.nameJogador1} & ${ij.nameJogador2} ",
                              style: AppTextStyles.headingBold.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 5,
                            bottom: 5,
                          ),
                          margin: AppEdgeInsets.hmd,
                          width: MediaQuery.of(context).size.width,
                          decoration: AppInputBorder.borderRadius.copyWith(
                            color: AppColors.grey800,
                          ),
                          child: Center(
                            child: Text(
                              ij.nameJogador1,
                              style: AppTextStyles.headingBold.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                  AppSpacing.min,
                  Text(
                    "${ij.time1}",
                    style: TextStyle(
                      color: Colors.redAccent[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonValue(
                        title: '+1',
                        onPress: () {
                          if (ij.time1 >= 0 &&
                              ij.time1 <= 11 &&
                              ij.time2 < 12) {
                            _changeTimeum(1);
                            ij.a = 1;
                            ij.b = 0;
                            _mensagemTime1();
                          }

                          if (ij.time2 >= 12) {
                            ij.messageTime1 = "Por favor, inicie um novo Jogo!";
                          }
                        },
                      ),
                      ButtonValue(
                        title: '-1',
                        onPress: () {
                          if (ij.time1 >= 1 &&
                              ij.time1 <= 13 &&
                              ij.time2 < 12) {
                            ij.decreaseTime1();
                            ij.a = -1;
                            ij.b = 0;
                            _mensagemTime1();
                            _mensagemTime2();
                          }
                        },
                      ),
                      ButtonValue(
                        title: 'Truco!',
                        onPress: () {
                          if (ij.time1 >= 0 &&
                              ij.time1 <= 11 &&
                              ij.time2 < 12) {
                            _changeTimeum(3);
                            ij.a = 3;
                            ij.b = 0;
                            _mensagemTime1();
                          }
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 45,
                    ),
                    child: Text(
                      ij.messageTime1,
                      style: TextStyle(
                          color: Colors.redAccent[700],
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ij.forPlayers == true
                      ? Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 5,
                            bottom: 5,
                          ),
                          margin: AppEdgeInsets.hmd,
                          width: MediaQuery.of(context).size.width,
                          decoration: AppInputBorder.borderRadius.copyWith(
                            color: AppColors.grey800,
                          ),
                          child: Center(
                            child: Text(
                              "${ij.nameJogador3} & ${ij.nameJogador4} ",
                              style: AppTextStyles.headingBold.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 5,
                            bottom: 5,
                          ),
                          margin: AppEdgeInsets.hmd,
                          width: MediaQuery.of(context).size.width,
                          decoration: AppInputBorder.borderRadius.copyWith(
                            color: AppColors.grey800,
                          ),
                          child: Center(
                            child: Text(
                              ij.nameJogador2,
                              style: AppTextStyles.headingBold.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                  Text(
                    "${ij.time2}",
                    style: TextStyle(
                      color: Colors.redAccent[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonValue(
                        title: '+1',
                        onPress: () {
                          if (ij.time2 >= 0 &&
                              ij.time2 <= 11 &&
                              ij.time1 < 12) {
                            _changeTimedois(1);
                            ij.a = 0;
                            ij.b = 1;

                            _mensagemTime2();
                          }
                        },
                      ),
                      ButtonValue(
                        title: '-1',
                        onPress: () {
                          if (ij.time2 >= 1 &&
                              ij.time2 <= 13 &&
                              ij.time1 < 12) {
                            _changeTimedois(-1);
                            ij.a = 0;
                            ij.b = -1;
                            _mensagemTime1();
                            _mensagemTime2();
                          }
                        },
                      ),
                      ButtonValue(
                        title: 'Truco!',
                        onPress: () {
                          if (ij.time2 >= 0 &&
                              ij.time2 <= 11 &&
                              ij.time1 < 12) {
                            _changeTimedois(3);
                            ij.a = 0;
                            ij.b = 3;

                            _mensagemTime2();
                          }
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: AppEdgeInsets.bmd,
                    child: Text(
                      ij.messageTime2,
                      style: TextStyle(
                        color: Colors.redAccent[700],
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void showNovoJogoTruco(context) {
    DialogHelper.open(
      context: context,
      content: AlertNovoJogoTruco(
        function: () async {
          ij.novoJogo();
          coolNavigate.goBack();
        },
      ),
    );
  }

  void showNovaPartida(context) {
    DialogHelper.open(
      context: context,
      content: AlertNovaPartida(
        function: () async {
          ij.deleteAll();
          coolNavigate.goBack();
          coolNavigate.removeUntil(NameRoute.escolhaJogoTruco);
        },
      ),
    );
  }
}
