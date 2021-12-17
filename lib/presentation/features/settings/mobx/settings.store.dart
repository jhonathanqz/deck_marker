import 'package:deck_marker/domain/entities/buraco.dart';
import 'package:deck_marker/domain/entities/truco.dart';
import 'package:deck_marker/domain/use_cases/delete_table_use_case.dart';
import 'package:deck_marker/domain/use_cases/get_players_buraco_settings_use_case.dart';
import 'package:deck_marker/domain/use_cases/get_players_truco_settings_use_case.dart';
import 'package:deck_marker/domain/use_cases/get_score_buraco_settings_use_case.dart';
import 'package:deck_marker/domain/use_cases/get_score_truco_settings_use_case.dart';
import 'package:deck_marker/domain/use_cases/set_players_buraco_settings_use_case.dart';
import 'package:deck_marker/domain/use_cases/set_players_truco_settings_use_case.dart';
import 'package:deck_marker/domain/use_cases/set_score_buraco_settings_use_case.dart';
import 'package:deck_marker/domain/use_cases/set_score_truco_settings_use_case.dart';
import 'package:deck_marker/presentation/shared/helpers/snack_helper.dart';
import 'package:deck_marker/presentation/shared/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'settings.store.g.dart';

class SettingsStore = SettingsBase with _$SettingsStore;

abstract class SettingsBase with Store {
  final GetScoreBuracoSettingsUseCase getScoreBuracoSettingsUseCase;
  final SetScoreBuracoSettingsUseCase setScoreBuracoSettingsUseCase;
  final DeleteTableUseCase deleteTableUseCase;
  final GetPlayersBuracoSettingsUseCase getPlayersBuracoSettingsUseCase;
  final SetPlayersBuracoSettingsUseCase setPlayersBuracoSettingsUseCase;
  final GetScoreTrucoSettingsUseCase getScoreTrucoSettingsUseCase;
  final SetScoreTrucoSettingsUseCase setScoreTrucoSettingsUseCase;
  final GetPlayersTrucoSettingsUseCase getPlayersTrucoSettingsUseCase;
  final SetPlayersTrucoSettingsUseCase setPlayersTrucoSettingsUseCase;

  SettingsBase({
    required this.getScoreBuracoSettingsUseCase,
    required this.setScoreBuracoSettingsUseCase,
    required this.deleteTableUseCase,
    required this.getPlayersBuracoSettingsUseCase,
    required this.setPlayersBuracoSettingsUseCase,
    required this.getScoreTrucoSettingsUseCase,
    required this.setScoreTrucoSettingsUseCase,
    required this.getPlayersTrucoSettingsUseCase,
    required this.setPlayersTrucoSettingsUseCase,
  });

  @observable
  bool isLoading = false;

  @observable
  var buraco = Buraco();

  @observable
  var truco = Truco();

  @observable
  bool error = false;

  @action
  void setScoreTeam1Buraco(String value) =>
      buraco = buraco.copyWith(scoreTeam1: value);

  @action
  void setScoreTeam2Buraco(String value) =>
      buraco = buraco.copyWith(scoreTeam2: value);

  @action
  void setPlayersTeam1Buraco(String value) =>
      buraco = buraco.copyWith(playersTeam1: value);

  @action
  void setPlayersTeam2Buraco(String value) =>
      buraco = buraco.copyWith(playersTeam2: value);

  @action
  void setScoreTeam1Truco(String value) =>
      truco = truco.copyWith(scoreTeam1: value);

  @action
  void setScoreTeam2Truco(String value) =>
      truco = truco.copyWith(scoreTeam2: value);

  @action
  void setPlayersTeam1Truco(String value) =>
      truco = truco.copyWith(playersTeam1: value);

  @action
  void setPlayersTeam2Truco(String value) =>
      truco = truco.copyWith(playersTeam2: value);

  @action
  Future<void> checkScoreBuraco({
    required Function() callbackSucess,
    required Function() navigateFail,
  }) async {
    try {
      isLoading = true;
      (await getScoreBuraco()).scoreTeam1;
      isLoading = false;
      callbackSucess();
    } catch (e) {
      isLoading = false;
      return navigateFail();
    }
  }

  @action
  Future<void> checkScoreTruco({
    required Function() callbackSucess,
    required Function() navigateFail,
  }) async {
    try {
      isLoading = true;
      (await getScoreTruco()).scoreTeam1;
      isLoading = false;
      callbackSucess();
    } catch (e) {
      isLoading = false;
      return navigateFail();
    }
  }

  @action
  Future<bool> hasScoreBuracoSettings() async {
    try {
      isLoading = true;
      await getScoreBuraco();
      isLoading = false;
      return true;
    } catch (e) {
      isLoading = false;
      return false;
    }
  }

  @action
  Future<bool> hasScoreTrucoSettings() async {
    try {
      isLoading = true;
      await getScoreTruco();
      isLoading = false;
      return true;
    } catch (e) {
      isLoading = false;
      return false;
    }
  }

  @action
  Future<void> checkPlayersBuracoSettings({
    required Function() callbackSucess,
    required Function() navigateFail,
  }) async {
    try {
      isLoading = true;
      (await getPlayersBuraco()).playersTeam1;
      isLoading = false;
      callbackSucess();
    } catch (e) {
      isLoading = false;
      return navigateFail();
    }
  }

  @action
  Future<void> checkPlayersTrucoSettings({
    required Function() callbackSucess,
    required Function() navigateFail,
  }) async {
    try {
      isLoading = true;
      (await getPlayersTruco()).playersTeam1;
      isLoading = false;
      callbackSucess();
    } catch (e) {
      isLoading = false;
      return navigateFail();
    }
  }

  @action
  Future<Buraco> getScoreBuraco() async {
    try {
      final score = await getScoreBuracoSettingsUseCase(
        buraco,
      );

      buraco = score;
      return buraco;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<Truco> getScoreTruco() async {
    try {
      final score = await getScoreTrucoSettingsUseCase(
        truco,
      );

      truco = score;
      return truco;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> setScoreBuraco({
    required BuildContext context,
    required String scoreTeam1,
    required String scoreTeam2,
    required Function() callbackSucess,
  }) async {
    try {
      isLoading = true;
      await setScoreBuracoSettingsUseCase(
        Buraco(
          scoreTeam1: scoreTeam1,
          scoreTeam2: scoreTeam2,
        ),
      );
      isLoading = false;
      callbackSucess();
    } catch (e) {
      isLoading = false;
      SnackHelper.showSnackInformation(
        'Erro ao gravar pontuação.',
        AppColors.redInformation,
        context,
      );
      rethrow;
    }
  }

  @action
  Future<void> setScoreTruco({
    required BuildContext context,
    required String scoreTeam1,
    required String scoreTeam2,
    required Function() callbackSucess,
  }) async {
    try {
      isLoading = true;
      await setScoreTrucoSettingsUseCase(
        Truco(
          scoreTeam1: scoreTeam1,
          scoreTeam2: scoreTeam2,
        ),
      );
      isLoading = false;
      print('**truco score: $scoreTeam1 & $scoreTeam2');
      callbackSucess();
    } catch (e) {
      isLoading = false;
      SnackHelper.showSnackInformation(
        'Erro ao gravar pontuação.',
        AppColors.redInformation,
        context,
      );
      rethrow;
    }
  }

  @action
  Future<void> deleteTable({
    required BuildContext context,
    required String table,
  }) async {
    try {
      isLoading = true;
      await deleteTableUseCase(table);
      isLoading = false;
    } catch (e) {
      isLoading = false;
      SnackHelper.showSnackInformation(
        'Erro ao excluir tabela do banco de dados.',
        AppColors.redInformation,
        context,
      );
      rethrow;
    }
  }

  @action
  Future<Buraco> getPlayersBuraco() async {
    try {
      final players = await getPlayersBuracoSettingsUseCase(
        buraco,
      );

      buraco = players;
      return buraco;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<Truco> getPlayersTruco() async {
    try {
      final players = await getPlayersTrucoSettingsUseCase(
        truco,
      );

      truco = players;
      return truco;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> setPlayersBuraco({
    required BuildContext context,
    required String playersTeam1,
    required String playersTeam2,
  }) async {
    try {
      isLoading = true;
      await setPlayersBuracoSettingsUseCase(
        Buraco(
          playersTeam1: playersTeam1,
          playersTeam2: playersTeam2,
        ),
      );
      isLoading = false;
    } catch (e) {
      isLoading = false;
      SnackHelper.showSnackInformation(
        'Erro ao gravar jogares.',
        AppColors.redInformation,
        context,
      );
      rethrow;
    }
  }

  @action
  Future<void> setPlayersTruco({
    required BuildContext context,
    required String playersTeam1,
    required String playersTeam2,
  }) async {
    try {
      isLoading = true;
      await setPlayersTrucoSettingsUseCase(
        Truco(
          playersTeam1: playersTeam1,
          playersTeam2: playersTeam2,
        ),
      );
      isLoading = false;
    } catch (e) {
      isLoading = false;
      SnackHelper.showSnackInformation(
        'Erro ao gravar jogares.',
        AppColors.redInformation,
        context,
      );
      rethrow;
    }
  }

  @action
  void wipeSettingsStore() {
    isLoading = false;
    error = false;
    buraco = Buraco();
    truco = Truco();
  }

  @action
  Future<void> wipeInitials({
    required BuildContext context,
  }) async {
    await deleteTable(
      context: context,
      table: 'ScoreBuraco',
    );
    await deleteTable(
      context: context,
      table: 'TeamBuraco',
    );
    await deleteTable(
      context: context,
      table: 'ScoreTruco',
    );
    await deleteTable(
      context: context,
      table: 'TeamTruco',
    );
  }
}
