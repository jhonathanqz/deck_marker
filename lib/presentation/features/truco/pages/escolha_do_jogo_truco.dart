import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/presentation/features/truco/mobx/truco.store.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:deck_marker/presentation/shared/widgets/card_options.dart';
import 'package:deck_marker/presentation/shared/widgets/scaffold/scaffold_primary.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EscolhaDoJogoTruco extends StatefulWidget {
  const EscolhaDoJogoTruco({Key? key}) : super(key: key);

  @override
  State<EscolhaDoJogoTruco> createState() => _EscolhaDoJogoTrucoState();
}

class _EscolhaDoJogoTrucoState extends State<EscolhaDoJogoTruco> {
  @override
  void initState() {
    deleteFiels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final ij = sl<TrucoStore>();
        return ScaffoldPrimary(
          title: 'Marcador de Truco',
          child: Column(
            children: [
              Container(
                padding: AppEdgeInsets.onlyTextHeader,
                child: const Text(
                  'Por favor, selecione logo a baixo a quantidade de jogadores:',
                  style: AppTextStyles.headingBold,
                ),
              ),
              Expanded(
                child: Container(
                  margin: AppEdgeInsets.sdAll,
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: <Widget>[
                      CardOptionsWidget(
                        imageDirectory: 'images/2personsBlack.png',
                        titleService: '2 Jogadores',
                        subTitleService: '(1 x 1)',
                        icon: FontAwesomeIcons.userFriends,
                        colorBackground: AppColors.cardsColor,
                        function: () {
                          ij.forPlayers = false;
                          coolNavigate.navigateTo(NameRoute.homeJogadorTruco);
                        },
                      ),
                      CardOptionsWidget(
                          imageDirectory: 'images/4personsBlack.png',
                          titleService: '4 Jogadores',
                          subTitleService: '(2 x 2)',
                          icon: FontAwesomeIcons.users,
                          colorBackground: AppColors.cardsColor,
                          function: () {
                            ij.forPlayers = true;
                            coolNavigate.navigateTo(NameRoute.homeJogadorTruco);
                          }),
                      CardOptionsWidget(
                        imageDirectory: 'images/sair1.png',
                        titleService: 'Sair do jogo',
                        subTitleService: '(Voltar a tela anterior)',
                        icon: FontAwesomeIcons.signOutAlt,
                        colorBackground: AppColors.mediumGrey,
                        function: () {
                          deleteFiels();
                          coolNavigate.removeUntil(NameRoute.home);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void deleteFiels() {
    final ij = sl<TrucoStore>();
    ij.deleteAll();
  }
}
