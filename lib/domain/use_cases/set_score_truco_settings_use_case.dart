import 'package:deck_marker/domain/entities/truco.dart';
import 'package:deck_marker/domain/repositories/settings_repository.dart';

class SetScoreTrucoSettingsUseCase {
  final SettingsRepository settingsRepository;

  SetScoreTrucoSettingsUseCase({required this.settingsRepository});

  Future<void> call(Truco truco) async {
    try {
      await settingsRepository.setScoreTruco(
        truco,
      );
    } catch (_) {
      rethrow;
    }
  }
}
