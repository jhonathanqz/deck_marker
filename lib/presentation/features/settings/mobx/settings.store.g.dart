// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on SettingsBase, Store {
  final _$isLoadingAtom = Atom(name: 'SettingsBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$buracoAtom = Atom(name: 'SettingsBase.buraco');

  @override
  Buraco get buraco {
    _$buracoAtom.reportRead();
    return super.buraco;
  }

  @override
  set buraco(Buraco value) {
    _$buracoAtom.reportWrite(value, super.buraco, () {
      super.buraco = value;
    });
  }

  final _$trucoAtom = Atom(name: 'SettingsBase.truco');

  @override
  Truco get truco {
    _$trucoAtom.reportRead();
    return super.truco;
  }

  @override
  set truco(Truco value) {
    _$trucoAtom.reportWrite(value, super.truco, () {
      super.truco = value;
    });
  }

  final _$errorAtom = Atom(name: 'SettingsBase.error');

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$checkScoreBuracoAsyncAction =
      AsyncAction('SettingsBase.checkScoreBuraco');

  @override
  Future<void> checkScoreBuraco(
      {required dynamic Function() callbackSucess,
      required dynamic Function() navigateFail}) {
    return _$checkScoreBuracoAsyncAction.run(() => super.checkScoreBuraco(
        callbackSucess: callbackSucess, navigateFail: navigateFail));
  }

  final _$checkScoreTrucoAsyncAction =
      AsyncAction('SettingsBase.checkScoreTruco');

  @override
  Future<void> checkScoreTruco(
      {required dynamic Function() callbackSucess,
      required dynamic Function() navigateFail}) {
    return _$checkScoreTrucoAsyncAction.run(() => super.checkScoreTruco(
        callbackSucess: callbackSucess, navigateFail: navigateFail));
  }

  final _$hasScoreBuracoSettingsAsyncAction =
      AsyncAction('SettingsBase.hasScoreBuracoSettings');

  @override
  Future<bool> hasScoreBuracoSettings() {
    return _$hasScoreBuracoSettingsAsyncAction
        .run(() => super.hasScoreBuracoSettings());
  }

  final _$hasScoreTrucoSettingsAsyncAction =
      AsyncAction('SettingsBase.hasScoreTrucoSettings');

  @override
  Future<bool> hasScoreTrucoSettings() {
    return _$hasScoreTrucoSettingsAsyncAction
        .run(() => super.hasScoreTrucoSettings());
  }

  final _$checkPlayersBuracoSettingsAsyncAction =
      AsyncAction('SettingsBase.checkPlayersBuracoSettings');

  @override
  Future<void> checkPlayersBuracoSettings(
      {required dynamic Function() callbackSucess,
      required dynamic Function() navigateFail}) {
    return _$checkPlayersBuracoSettingsAsyncAction.run(() => super
        .checkPlayersBuracoSettings(
            callbackSucess: callbackSucess, navigateFail: navigateFail));
  }

  final _$checkPlayersTrucoSettingsAsyncAction =
      AsyncAction('SettingsBase.checkPlayersTrucoSettings');

  @override
  Future<void> checkPlayersTrucoSettings(
      {required dynamic Function() callbackSucess,
      required dynamic Function() navigateFail}) {
    return _$checkPlayersTrucoSettingsAsyncAction.run(() => super
        .checkPlayersTrucoSettings(
            callbackSucess: callbackSucess, navigateFail: navigateFail));
  }

  final _$getScoreBuracoAsyncAction =
      AsyncAction('SettingsBase.getScoreBuraco');

  @override
  Future<Buraco> getScoreBuraco() {
    return _$getScoreBuracoAsyncAction.run(() => super.getScoreBuraco());
  }

  final _$getScoreTrucoAsyncAction = AsyncAction('SettingsBase.getScoreTruco');

  @override
  Future<Truco> getScoreTruco() {
    return _$getScoreTrucoAsyncAction.run(() => super.getScoreTruco());
  }

  final _$setScoreBuracoAsyncAction =
      AsyncAction('SettingsBase.setScoreBuraco');

  @override
  Future<void> setScoreBuraco(
      {required BuildContext context,
      required String scoreTeam1,
      required String scoreTeam2,
      required dynamic Function() callbackSucess}) {
    return _$setScoreBuracoAsyncAction.run(() => super.setScoreBuraco(
        context: context,
        scoreTeam1: scoreTeam1,
        scoreTeam2: scoreTeam2,
        callbackSucess: callbackSucess));
  }

  final _$setScoreTrucoAsyncAction = AsyncAction('SettingsBase.setScoreTruco');

  @override
  Future<void> setScoreTruco(
      {required BuildContext context,
      required String scoreTeam1,
      required String scoreTeam2,
      required dynamic Function() callbackSucess}) {
    return _$setScoreTrucoAsyncAction.run(() => super.setScoreTruco(
        context: context,
        scoreTeam1: scoreTeam1,
        scoreTeam2: scoreTeam2,
        callbackSucess: callbackSucess));
  }

  final _$deleteTableAsyncAction = AsyncAction('SettingsBase.deleteTable');

  @override
  Future<void> deleteTable(
      {required BuildContext context, required String table}) {
    return _$deleteTableAsyncAction
        .run(() => super.deleteTable(context: context, table: table));
  }

  final _$getPlayersBuracoAsyncAction =
      AsyncAction('SettingsBase.getPlayersBuraco');

  @override
  Future<Buraco> getPlayersBuraco() {
    return _$getPlayersBuracoAsyncAction.run(() => super.getPlayersBuraco());
  }

  final _$getPlayersTrucoAsyncAction =
      AsyncAction('SettingsBase.getPlayersTruco');

  @override
  Future<Truco> getPlayersTruco() {
    return _$getPlayersTrucoAsyncAction.run(() => super.getPlayersTruco());
  }

  final _$setPlayersBuracoAsyncAction =
      AsyncAction('SettingsBase.setPlayersBuraco');

  @override
  Future<void> setPlayersBuraco(
      {required BuildContext context,
      required String playersTeam1,
      required String playersTeam2}) {
    return _$setPlayersBuracoAsyncAction.run(() => super.setPlayersBuraco(
        context: context,
        playersTeam1: playersTeam1,
        playersTeam2: playersTeam2));
  }

  final _$setPlayersTrucoAsyncAction =
      AsyncAction('SettingsBase.setPlayersTruco');

  @override
  Future<void> setPlayersTruco(
      {required BuildContext context,
      required String playersTeam1,
      required String playersTeam2}) {
    return _$setPlayersTrucoAsyncAction.run(() => super.setPlayersTruco(
        context: context,
        playersTeam1: playersTeam1,
        playersTeam2: playersTeam2));
  }

  final _$wipeInitialsAsyncAction = AsyncAction('SettingsBase.wipeInitials');

  @override
  Future<void> wipeInitials({required BuildContext context}) {
    return _$wipeInitialsAsyncAction
        .run(() => super.wipeInitials(context: context));
  }

  final _$SettingsBaseActionController = ActionController(name: 'SettingsBase');

  @override
  void setScoreTeam1Buraco(String value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.setScoreTeam1Buraco');
    try {
      return super.setScoreTeam1Buraco(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScoreTeam2Buraco(String value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.setScoreTeam2Buraco');
    try {
      return super.setScoreTeam2Buraco(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlayersTeam1Buraco(String value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.setPlayersTeam1Buraco');
    try {
      return super.setPlayersTeam1Buraco(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlayersTeam2Buraco(String value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.setPlayersTeam2Buraco');
    try {
      return super.setPlayersTeam2Buraco(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScoreTeam1Truco(String value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.setScoreTeam1Truco');
    try {
      return super.setScoreTeam1Truco(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScoreTeam2Truco(String value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.setScoreTeam2Truco');
    try {
      return super.setScoreTeam2Truco(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlayersTeam1Truco(String value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.setPlayersTeam1Truco');
    try {
      return super.setPlayersTeam1Truco(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlayersTeam2Truco(String value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.setPlayersTeam2Truco');
    try {
      return super.setPlayersTeam2Truco(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void wipeSettingsStore() {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.wipeSettingsStore');
    try {
      return super.wipeSettingsStore();
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
buraco: ${buraco},
truco: ${truco},
error: ${error}
    ''';
  }
}
