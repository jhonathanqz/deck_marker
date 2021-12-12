import 'package:deck_marker/domain/repositories/settings_repository.dart';

class DeleteTableUseCase {
  final SettingsRepository settingsRepository;

  DeleteTableUseCase({required this.settingsRepository});

  Future<void> call(String table) async {
    try {
      await settingsRepository.deleteTable(table);
    } catch (_) {
      rethrow;
    }
  }
}
