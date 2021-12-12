import 'package:deck_marker/domain/entities/buraco.dart';
import 'package:deck_marker/domain/repositories/settings_repository.dart';

class SetPlayersBuracoSettingsUseCase {
  final SettingsRepository settingsRepository;

  SetPlayersBuracoSettingsUseCase({required this.settingsRepository});

  Future<void> call(Buraco buraco) async {
    try {
      await settingsRepository.setPlayersBuraco(buraco);
    } catch (_) {
      rethrow;
    }
  }
}
