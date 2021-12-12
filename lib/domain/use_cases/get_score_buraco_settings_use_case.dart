import 'package:deck_marker/domain/entities/buraco.dart';
import 'package:deck_marker/domain/repositories/settings_repository.dart';

class GetScoreBuracoSettingsUseCase {
  final SettingsRepository settingsRepository;

  GetScoreBuracoSettingsUseCase({required this.settingsRepository});

  Future<Buraco> call(Buraco buraco) async {
    try {
      return await settingsRepository.getScoreBuraco(
        buraco,
      );
    } catch (_) {
      rethrow;
    }
  }
}
