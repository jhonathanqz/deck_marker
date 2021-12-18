import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/features/settings/mobx/settings.store.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_input_border.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
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
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black38,
                      size: 35,
                    ),
                    onPressed: () => coolNavigate.goBack(),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 130,
                        child: Image.asset(
                          'images/trofeu1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      padding: AppEdgeInsets.tmd,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: ijBuracoStore.time1Venceu == true
                              ? 'Parabéns \nTime 1 Venceu!!!'
                              : 'Parabéns \nTime 2 Venceu!!!',
                          style: TextStyle(
                            color: AppColors.grey900,
                            fontSize: 21,
                            fontWeight: FontWeight.w800,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ijBuracoStore.time1Venceu == true
                                  ? '\n\nA pontuação final \nfoi de: '
                                  : '\n\nA pontuação final \nfoi de: ',
                              style: TextStyle(
                                color: AppColors.grey900,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ijBuracoStore.time1Venceu == true
                                  ? '${ijBuracoStore.pontosTime1}'
                                  : '${ijBuracoStore.pontosTime2}',
                              style: TextStyle(
                                color: AppColors.grey900,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                      coolNavigate.goBack();
                    },
                    child: Container(
                      height: 40,
                      decoration: AppInputBorder.borderRadius.copyWith(
                        color: AppColors.yellow700,
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.yellow700,
                        child: const Center(
                          child: Text(
                            'Novo Jogo!',
                            style: AppTextStyles.headingBold,
                          ),
                        ),
                      ),
                    )),
                AppSpacing.min,
                TextButton(
                  onPressed: () async {
                    await ss.wipeInitials(context: context);
                    ijBuracoStore.clearFieldsBuraco();
                    coolNavigate
                        .pushReplacementNamed(NameRoute.escolhaJogoBuraco);
                  },
                  child: Text(
                    'Nova Partida',
                    style: AppTextStyles.titleBold.copyWith(
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
