import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/features/settings/mobx/settings.store.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AlertWinner extends StatelessWidget {
  const AlertWinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final ijBuracoStore = sl<BuracoStore>();
        final ss = sl<SettingsStore>();
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          backgroundColor: Colors.grey[100],
          title: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.black38,
                      size: 35,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 50, bottom: 20),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 130,
                        child: Image.asset(
                          'images/trofeu1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 20),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: ijBuracoStore.time1Venceu == true
                                  ? 'Parabéns \nTime 1 Venceu!!!'
                                  : 'Parabéns \nTime 2 Venceu!!!',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 21,
                                  fontWeight: FontWeight.w800),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ijBuracoStore.time1Venceu == true
                                      ? '\n\nA pontuação final \nfoi de: '
                                      : '\n\nA pontuação final \nfoi de: ',
                                  style: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                TextSpan(
                                  text: ijBuracoStore.time1Venceu == true
                                      ? '${ijBuracoStore.pontosTime1}'
                                      : '${ijBuracoStore.pontosTime2}',
                                  style: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ]),
                        )),
                  ],
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: 95,
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      ijBuracoStore.novoJogo();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.yellow[700],
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.yellow[700],
                        child: Center(
                          child: Text('Novo Jogo!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20)),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () async {
                    await ss.wipeInitials(context: context);
                    ijBuracoStore.clearFieldsBuraco();
                    coolNavigate
                        .pushReplacementNamed(NameRoute.escolhaJogoBuraco);
                  },
                  child: Text(
                    'Nova Partida',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
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
}
