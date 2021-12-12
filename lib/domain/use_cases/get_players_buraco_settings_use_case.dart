import 'package:deck_marker/domain/entities/buraco.dart';
import 'package:deck_marker/domain/repositories/settings_repository.dart';

class GetPlayersBuracoSettingsUseCase {
  final SettingsRepository settingsRepository;

  GetPlayersBuracoSettingsUseCase({required this.settingsRepository});

  Future<Buraco> call(Buraco buraco) async {
    try {
      return await settingsRepository.getTeamBuraco(
        buraco,
      );
    } catch (_) {
      rethrow;
    }
  }
}
