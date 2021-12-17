import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/card_escolha_jogo.dart';
import 'package:deck_marker/presentation/features/truco/mobx/truco.store.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_images.dart';
import 'package:deck_marker/presentation/shared/widgets/scaffold/scaffold_primary.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EscolhaMarcador extends StatelessWidget {
  EscolhaMarcador({Key? key}) : super(key: key);

  final ijBuracoStore = sl<BuracoStore>();
  final ijTrucoStore = sl<TrucoStore>();

  @override
  Widget build(BuildContext context) {
    ijBuracoStore.clearFieldsBuraco();
    ijTrucoStore.deleteAll();
    return Observer(
      builder: (_) {
        return ScaffoldPrimary(
          title: 'Escolha do Marcador',
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: AppEdgeInsets.sdAll,
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: <Widget>[
                      CardEscolhaJogo(
                        directoryImage: AppImages.trucoIcon,
                        titleService: 'Marcador',
                        subTitleService: 'Truco',
                        icon: FontAwesomeIcons.userFriends,
                        colorBackground: AppColors.cardsColor,
                        function: () {
                          coolNavigate.navigateTo(NameRoute.escolhaJogoTruco);
                          //coolNavigate.navigateTo(NameRoute.trucoTeste);
                        },
                      ),
                      CardEscolhaJogo(
                        directoryImage: AppImages.buracoIcon,
                        titleService: 'Marcador',
                        subTitleService: 'Buraco',
                        icon: FontAwesomeIcons.users,
                        colorBackground: AppColors.cardsColor,
                        function: () {
                          coolNavigate.navigateTo(NameRoute.escolhaJogoBuraco);
                        },
                      ),
                      CardEscolhaJogo(
                        directoryImage: 'images/sair2.png',
                        titleService: 'Sair do App',
                        subTitleService: '',
                        icon: FontAwesomeIcons.signOutAlt,
                        colorBackground: AppColors.mediumGrey,
                        function: () {
                          ijBuracoStore.clearFieldsBuraco();
                          ijTrucoStore.deleteAll();
                          SystemNavigator.pop();
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
}
