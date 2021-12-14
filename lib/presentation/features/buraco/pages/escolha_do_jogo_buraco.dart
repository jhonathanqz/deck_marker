import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:deck_marker/presentation/shared/widgets/card_options.dart';
import 'package:deck_marker/presentation/shared/widgets/scaffold/scaffold_primary.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EscolhaDoJogoBuraco extends StatefulWidget {
  const EscolhaDoJogoBuraco({Key? key}) : super(key: key);
  @override
  State<EscolhaDoJogoBuraco> createState() => _EscolhaDoJogoBuracoState();
}

class _EscolhaDoJogoBuracoState extends State<EscolhaDoJogoBuraco> {
  @override
  void initState() {
    deactivate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final ijBuracoStore = sl<BuracoStore>();
        return ScaffoldPrimary(
          title: 'Marcador de Buraco',
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
                        imageDirectory: 'images/2persons.png',
                        titleService: '2 Jogadores',
                        subTitleService: '(1 x 1)',
                        icon: FontAwesomeIcons.userFriends,
                        colorBackground: AppColors.cardsColor,
                        function: () {
                          ijBuracoStore.clearFieldsBuraco();
                          ijBuracoStore.players2Buraco = true;
                          coolNavigate.navigateTo(NameRoute.jogadoresBuraco);
                        },
                      ),
                      CardOptionsWidget(
                        imageDirectory: 'images/4persons.png',
                        titleService: '4 Jogadores',
                        subTitleService: '(2 x 2)',
                        icon: FontAwesomeIcons.users,
                        colorBackground: AppColors.cardsColor,
                        function: () {
                          ijBuracoStore.clearFieldsBuraco();
                          ijBuracoStore.players4Buraco = true;
                          ijBuracoStore.variosPlayers = true;
                          coolNavigate.navigateTo(NameRoute.jogadoresBuraco);
                        },
                      ),
                      CardOptionsWidget(
                        imageDirectory: 'images/6persons2.png',
                        titleService: '6 Jogadores',
                        subTitleService: '(3 x 3)',
                        icon: FontAwesomeIcons.users,
                        colorBackground: AppColors.cardsColor,
                        function: () {
                          ijBuracoStore.clearFieldsBuraco();
                          ijBuracoStore.players6Buraco = true;
                          ijBuracoStore.variosPlayers = true;
                          coolNavigate.navigateTo(NameRoute.jogadoresBuraco);
                        },
                      ),
                      CardOptionsWidget(
                        imageDirectory: 'images/8persons2.png',
                        titleService: '8 Jogadores',
                        subTitleService: '(4 x 4)',
                        icon: FontAwesomeIcons.users,
                        colorBackground: AppColors.cardsColor,
                        function: () {
                          ijBuracoStore.clearFieldsBuraco();
                          ijBuracoStore.players8Buraco = true;
                          ijBuracoStore.variosPlayers = true;
                          coolNavigate.navigateTo(NameRoute.jogadoresBuraco);
                        },
                      ),
                      CardOptionsWidget(
                        imageDirectory: 'images/10persons.png',
                        titleService: '10 Jogadores',
                        subTitleService: '(5 x 5)',
                        icon: FontAwesomeIcons.users,
                        colorBackground: AppColors.cardsColor,
                        function: () {
                          ijBuracoStore.clearFieldsBuraco();
                          ijBuracoStore.players10Buraco = true;
                          ijBuracoStore.variosPlayers = true;
                          coolNavigate.navigateTo(NameRoute.jogadoresBuraco);
                        },
                      ),
                      CardOptionsWidget(
                        imageDirectory: 'images/sair1.png',
                        titleService: 'Sair do jogo',
                        subTitleService: '(Voltar a tela anterior)',
                        icon: FontAwesomeIcons.signOutAlt,
                        colorBackground: AppColors.mediumGrey,
                        function: () {
                          deleteFields();
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

  void deleteFields() {
    final ijBuracoStore = sl<BuracoStore>();
    ijBuracoStore.clearFieldsBuraco();
  }
}
