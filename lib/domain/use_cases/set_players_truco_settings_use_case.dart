import 'package:deck_marker/domain/entities/truco.dart';
import 'package:deck_marker/domain/repositories/settings_repository.dart';

class SetPlayersTrucoSettingsUseCase {
  final SettingsRepository settingsRepository;

  SetPlayersTrucoSettingsUseCase({required this.settingsRepository});

  Future<void> call(Truco truco) async {
    try {
      await settingsRepository.setPlayersTruco(truco);
    } catch (_) {
      rethrow;
    }
  }
}
