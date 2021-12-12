import 'package:deck_marker/domain/entities/buraco.dart';
import 'package:deck_marker/domain/repositories/settings_repository.dart';

class SetScoreBuracoSettingsUseCase {
  final SettingsRepository settingsRepository;

  SetScoreBuracoSettingsUseCase({required this.settingsRepository});

  Future<void> call(Buraco buraco) async {
    try {
      await settingsRepository.setScoreBuraco(
        buraco,
      );
    } catch (_) {
      rethrow;
    }
  }
}
