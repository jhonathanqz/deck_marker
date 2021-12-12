import 'package:deck_marker/data/features/settings/provider/settings_provider_impl.dart';
import 'package:deck_marker/domain/repositories/settings_repository.dart';
import 'package:deck_marker/domain/use_cases/delete_table_use_case.dart';
import 'package:deck_marker/domain/use_cases/get_players_buraco_settings_use_case.dart';
import 'package:deck_marker/domain/use_cases/get_score_buraco_settings_use_case.dart';
import 'package:deck_marker/domain/use_cases/set_players_buraco_settings_use_case.dart';
import 'package:deck_marker/domain/use_cases/set_score_buraco_settings_use_case.dart';
import 'package:deck_marker/infrastructure/features/settings/repositories/contracts/settings_provider.dart';
import 'package:deck_marker/infrastructure/features/settings/repositories/settings_repository_impl.dart';
import 'package:deck_marker/presentation/features/buraco/mobx/buraco.store.dart';
import 'package:deck_marker/presentation/features/settings/mobx/settings.store.dart';
import 'package:deck_marker/presentation/features/splash/mobx/splash.store.dart';
import 'package:deck_marker/presentation/features/truco/mobx/truco.store.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

void setupDependencies() {
  setupProvider();
  setupRepository();
  setupUseCase();
  setupMobx();
}

void setupProvider() {
  sl.registerLazySingleton<SettingsProvider>(
    () => SettingsProviderImpl(),
  );
}

void setupRepository() {
  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      settingsProvider: sl<SettingsProvider>(),
    ),
  );
}

void setupUseCase() {
  sl.registerLazySingleton<GetScoreBuracoSettingsUseCase>(
    () => GetScoreBuracoSettingsUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );

  sl.registerLazySingleton<SetScoreBuracoSettingsUseCase>(
    () => SetScoreBuracoSettingsUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );

  sl.registerLazySingleton<DeleteTableUseCase>(
    () => DeleteTableUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );

  sl.registerLazySingleton<GetPlayersBuracoSettingsUseCase>(
    () => GetPlayersBuracoSettingsUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );

  sl.registerLazySingleton<SetPlayersBuracoSettingsUseCase>(
    () => SetPlayersBuracoSettingsUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );
}

setupMobx() {
  sl.registerLazySingleton<SplashStore>(() => SplashStore());
  sl.registerLazySingleton<TrucoStore>(() => TrucoStore());
  sl.registerLazySingleton<BuracoStore>(() => BuracoStore());

  sl.registerLazySingleton<SettingsStore>(
    () => SettingsStore(
      getScoreBuracoSettingsUseCase: sl<GetScoreBuracoSettingsUseCase>(),
      setScoreBuracoSettingsUseCase: sl<SetScoreBuracoSettingsUseCase>(),
      deleteTableUseCase: sl<DeleteTableUseCase>(),
      getPlayersBuracoSettingsUseCase: sl<GetPlayersBuracoSettingsUseCase>(),
      setPlayersBuracoSettingsUseCase: sl<SetPlayersBuracoSettingsUseCase>(),
    ),
  );
}
