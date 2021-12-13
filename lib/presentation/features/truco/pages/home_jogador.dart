import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/presentation/features/truco/mobx/truco.store.dart';
import 'package:deck_marker/presentation/features/truco/pages/jogo_truco.dart';
import 'package:deck_marker/presentation/shared/helpers/snack_helper.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:deck_marker/presentation/shared/widgets/button/button_primary.dart';
import 'package:deck_marker/presentation/shared/widgets/scaffold/scaffold_primary.dart';
import 'package:deck_marker/presentation/shared/widgets/textfield/simple_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeJogador extends StatelessWidget {
  HomeJogador({Key? key}) : super(key: key);
  final ij = sl<TrucoStore>();
  final TextEditingController namePlayer1Controller = TextEditingController();
  final TextEditingController namePlayer2Controller = TextEditingController();
  final TextEditingController namePlayer3Controller = TextEditingController();
  final TextEditingController namePlayer4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPrimary(
      title: 'Marcador de Truco',
      child: Container(
        color: Colors.grey[200],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: AppEdgeInsets.sdAll,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 8,
                bottom: 15,
              ),
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  "images/logo.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const Padding(
              padding: AppEdgeInsets.sdAll,
              child: SizedBox(
                child: Text(
                  "Digite logo a baixo o nome dos jogadores por favor:",
                  style: AppTextStyles.headingBold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            AppSpacing.md,
            Observer(
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ij.forPlayers == true
                        ? Container(
                            padding: AppEdgeInsets.bmd,
                            child: const Text(
                              'Nomes dupla 1:',
                              style: AppTextStyles.titleBold,
                            ),
                          )
                        : Container(),
                    Center(
                      child: SimpleTextField(
                        onChanged: ij.setJogador1,
                        textEditingController: namePlayer1Controller,
                        labelText: 'Nome Jogador(a) 1',
                        hintText: 'Nome:',
                        textInputType: TextInputType.text,
                        onSubmitted: (_) {},
                      ),
                    ),
                    AppSpacing.md,
                    Center(
                      child: SimpleTextField(
                        onChanged: ij.setJogador2,
                        textEditingController: namePlayer2Controller,
                        labelText: 'Nome Jogador(a) 2',
                        hintText: 'Nome:',
                        textInputType: TextInputType.text,
                        onSubmitted: (_) {},
                      ),
                    ),
                    AppSpacing.md,
                    AppSpacing.sm,
                    Observer(
                      builder: (_) {
                        return ij.forPlayers == true
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      bottom: 15,
                                    ),
                                    child: Text(
                                      'Nomes dupla 2:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: SimpleTextField(
                                      onChanged: ij.setJogador3,
                                      textEditingController:
                                          namePlayer3Controller,
                                      labelText: 'Nome Jogador(a) 3',
                                      hintText: 'Nome:',
                                      textInputType: TextInputType.text,
                                      onSubmitted: (_) {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: SimpleTextField(
                                      onChanged: ij.setJogador4,
                                      textEditingController:
                                          namePlayer4Controller,
                                      labelText: 'Nome Jogador(a) 4',
                                      hintText: 'Nome:',
                                      textInputType: TextInputType.text,
                                      onSubmitted: (_) {},
                                    ),
                                  ),
                                ],
                              )
                            : Container();
                      },
                    ),
                    AppSpacing.md,
                    AppSpacing.sm,
                    ButtonPrimary(
                      onTap: () => _start(context),
                      title: 'Entrar',
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void _start(BuildContext context) {
    if (ij.forPlayers == true && ij.isForPlayersValid == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomeJogo(),
        ),
      );
    } else if (ij.isPlayersValid == true && ij.forPlayers == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomeJogo(),
        ),
      );
    } else {
      _onFail(context);
    }
  }

  void _onFail(BuildContext context) {
    SnackHelper.showSnackInformation(
      'Existe campos em branco, verifique!',
      Colors.red,
      context,
    );
  }
}
