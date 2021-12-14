import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';

class CardTime2 extends StatelessWidget {
  const CardTime2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final ijBuracoStore = sl<BuracoStore>();
        return Container(
          margin: AppEdgeInsets.sdAll,
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          //height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Time 2',
                  style: AppTextStyles.headingBold,
                ),
              ),
              AppSpacing.sm,
              Center(
                child: Text(
                  '${ijBuracoStore.pontosTime2}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              AppSpacing.sm,
              Center(
                child: SizedBox(
                  height: 60,
                  child: Image.asset(
                    ijBuracoStore.time2Venceu == true
                        ? 'images/trofeu1.png'
                        : 'images/cartas1.png',
                  ),
                ),
              ),
              AppSpacing.sm,
              Container(
                margin: AppEdgeInsets.hsd,
                child: RichText(
                  text: TextSpan(
                    text: 'Integrantes: ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ijBuracoStore.fullPlayersTeam2,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      )
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
