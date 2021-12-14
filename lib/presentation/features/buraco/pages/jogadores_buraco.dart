import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/presentation/features/buraco/form/time_dois/form_players_team2.dart';
import 'package:deck_marker/presentation/features/buraco/form/time_um/form_players_team1.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/features/settings/mobx/settings.store.dart';
import 'package:deck_marker/presentation/shared/helpers/snack_helper.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:deck_marker/presentation/shared/style/app_edge_insets.dart';
import 'package:deck_marker/presentation/shared/style/app_images.dart';
import 'package:deck_marker/presentation/shared/style/app_spacing.dart';
import 'package:deck_marker/presentation/shared/style/app_text_styles.dart';
import 'package:deck_marker/presentation/shared/widgets/button/button_primary.dart';
import 'package:deck_marker/presentation/shared/widgets/scaffold/scaffold_primary.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class JogadoresBuraco extends StatelessWidget {
  JogadoresBuraco({Key? key}) : super(key: key);

  final ijBuracoStore = sl<BuracoStore>();
  final settingsStore = sl<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ScaffoldPrimary(
          isLoading: settingsStore.isLoading,
          title: 'Marcador jogo Buraco',
          child: Container(
            color: AppColors.grey2,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: AppEdgeInsets.sdAll,
            child: ListView(
              children: [
                Padding(
                  padding: AppEdgeInsets.sdAll,
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      AppImages.buraco,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Padding(
                  padding: AppEdgeInsets.sdAll,
                  child: Text(
                    "Digite logo a baixo o nome dos jogadores por favor:",
                    style: AppTextStyles.headingBold,
                    textAlign: TextAlign.center,
                  ),
                ),
                AppSpacing.md,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: ijBuracoStore.players4Buraco == true ||
                          ijBuracoStore.players6Buraco == true ||
                          ijBuracoStore.players8Buraco == true ||
                          ijBuracoStore.players10Buraco == true,
                      child: Container(
                        padding: AppEdgeInsets.bsd,
                        child: const Text(
                          'Nomes dupla 1:',
                          style: AppTextStyles.titleBold,
                        ),
                      ),
                    ),
                    ijBuracoStore.players2Buraco == true
                        ? const FormPlayersTeam1(
                            numberPlayers: 2,
                          )
                        : Container(),
                    ijBuracoStore.players4Buraco == true
                        ? const FormPlayersTeam1(
                            numberPlayers: 4,
                          )
                        : Container(),
                    ijBuracoStore.players6Buraco == true
                        ? const FormPlayersTeam1(
                            numberPlayers: 6,
                          )
                        : Container(),
                    ijBuracoStore.players8Buraco == true
                        ? const FormPlayersTeam1(
                            numberPlayers: 8,
                          )
                        : Container(),
                    ijBuracoStore.players10Buraco == true
                        ? const FormPlayersTeam1(
                            numberPlayers: 10,
                          )
                        : Container(),
                    AppSpacing.md,
                    //******************************************************************************************************************************************** */
                    Visibility(
                      visible: ijBuracoStore.variosPlayers,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: AppEdgeInsets.bmd,
                            child: const Text(
                              'Nomes dupla 2:',
                              style: AppTextStyles.titleBold,
                            ),
                          ),
                          ijBuracoStore.players4Buraco == true
                              ? const FormPlayersTeam2(
                                  numberPlayers: 4,
                                )
                              : Container(),
                          ijBuracoStore.players6Buraco == true
                              ? const FormPlayersTeam2(
                                  numberPlayers: 6,
                                )
                              : Container(),
                          ijBuracoStore.players8Buraco == true
                              ? const FormPlayersTeam2(
                                  numberPlayers: 8,
                                )
                              : Container(),
                          ijBuracoStore.players10Buraco == true
                              ? const FormPlayersTeam2(
                                  numberPlayers: 10,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    AppSpacing.xl,
                    ButtonPrimary(
                      onTap: () => _validFormPlayers(context),
                      title: 'Entrar',
                    ),
                    AppSpacing.xl,
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _validFormPlayers(BuildContext context) async {
    if (ijBuracoStore.players2Buraco == true &&
        ijBuracoStore.isPlayersValid == true) {
      ijBuracoStore.setFullPlayersTeam();
      await _initialSetupBD(context);
      coolNavigate.pushReplacementNamed(
        NameRoute.jogoBuraco,
      );
    } else if (ijBuracoStore.players4Buraco == true &&
        ijBuracoStore.isForPlayersValid == true) {
      ijBuracoStore.setFullPlayersTeam();
      await _initialSetupBD(context);
      coolNavigate.pushReplacementNamed(
        NameRoute.jogoBuraco,
      );
    } else if (ijBuracoStore.players6Buraco == true &&
        ijBuracoStore.is6PlayersValid == true) {
      ijBuracoStore.setFullPlayersTeam();
      await _initialSetupBD(context);
      coolNavigate.pushReplacementNamed(
        NameRoute.jogoBuraco,
      );
    } else if (ijBuracoStore.players8Buraco == true &&
        ijBuracoStore.is8PlayersValid == true) {
      ijBuracoStore.setFullPlayersTeam();
      await _initialSetupBD(context);
      coolNavigate.pushReplacementNamed(
        NameRoute.jogoBuraco,
      );
    } else if (ijBuracoStore.players10Buraco == true &&
        ijBuracoStore.is10PlayersValid == true) {
      ijBuracoStore.setFullPlayersTeam();
      await _initialSetupBD(context);
      coolNavigate.pushReplacementNamed(
        NameRoute.jogoBuraco,
      );
    } else {
      _onFail(context);
    }
  }

  Future<void> _initialSetupBD(BuildContext context) async {
    await settingsStore.setPlayersBuraco(
      context: context,
      playersTeam1: ijBuracoStore.fullPlayersTeam1,
      playersTeam2: ijBuracoStore.fullPlayersTeam2,
    );
    await settingsStore.setScoreBuraco(
      context: context,
      scoreTeam1: '0',
      scoreTeam2: '0',
      callbackSucess: () {},
    );
  }

  void _onFail(BuildContext context) {
    SnackHelper.showSnackInformation(
      'Existe campos em branco, verifique!',
      Colors.red,
      context,
    );
  }
}
