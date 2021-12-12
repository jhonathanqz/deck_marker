import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/features/buraco/pages/escolha_do_jogo_buraco.dart';
import 'package:deck_marker/presentation/features/buraco/widgets/card_escolha_jogo.dart';
import 'package:deck_marker/presentation/features/truco/mobx/truco.store.dart';
import 'package:deck_marker/presentation/features/truco/pages/escolha_do_jogo_truco.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/widgets/scaffold/scaffold_primary.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EscolhaMarcador extends StatelessWidget {
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
                  margin: EdgeInsets.all(8),
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: <Widget>[
                      CardEscolhaJogo(
                          directoryImage: 'images/truco2.png',
                          titleService: 'Marcador',
                          subTitleService: 'Truco',
                          icon: FontAwesomeIcons.userFriends,
                          colorBackground: AppColors.cardsColor,
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        EscolhaDoJogoTruco()));
                          }),
                      CardEscolhaJogo(
                        directoryImage: 'images/buraco3.png',
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
