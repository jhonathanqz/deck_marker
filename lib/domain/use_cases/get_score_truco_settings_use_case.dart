import 'package:deck_marker/domain/entities/buraco.dart';
import 'package:deck_marker/domain/entities/truco.dart';
import 'package:deck_marker/domain/repositories/settings_repository.dart';

class GetScoreTrucoSettingsUseCase {
  final SettingsRepository settingsRepository;

  GetScoreTrucoSettingsUseCase({required this.settingsRepository});

  Future<Truco> call(Truco truco) async {
    try {
      return await settingsRepository.getScoreTruco(
        truco,
      );
    } catch (_) {
      rethrow;
    }
  }
}
