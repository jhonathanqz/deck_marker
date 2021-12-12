import 'package:deck_marker/app/injection_container.dart';
import 'package:deck_marker/app/name_route.dart';
import 'package:deck_marker/domain/entities/user_settings.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/features/settings/mobx/settings.store.dart';
import 'package:deck_marker/utils/cool_navigate.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'splash.store.g.dart';

class SplashStore = SplashBase with _$SplashStore;

abstract class SplashBase with Store {
  @action
  Future<void> dismissSplashScreen(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    final settingsStore = sl<SettingsStore>();
    await settingsStore.checkPlayersBuracoSettings(
      callbackSucess: () async {
        await setScoreBD(context);
        coolNavigate.removeUntil(NameRoute.jogoBuraco);
      },
      navigateFail: () {
        coolNavigate.removeUntil(NameRoute.home);
      },
    );
  }

  @action
  Future<void> setScoreBD(BuildContext context) async {
    final bs = sl<BuracoStore>();
    final settingsStore = sl<SettingsStore>();
    bs.pontosTime1 =
        int.tryParse(((await settingsStore.getScoreBuraco()).scoreTeam1))!;
    bs.pontosTime2 =
        int.tryParse(((await settingsStore.getScoreBuraco()).scoreTeam2))!;
    bs.fullPlayersTeam1 =
        ((await settingsStore.getPlayersBuraco()).playersTeam1);
    bs.fullPlayersTeam2 =
        ((await settingsStore.getPlayersBuraco()).playersTeam2);

    print('Salvei os pontos: ${bs.pontosTime1}');
  }
}
