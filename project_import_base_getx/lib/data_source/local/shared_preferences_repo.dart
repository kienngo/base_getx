import 'package:base_getx/data_source/local/shared_preferences_repo.dart';

class SharedPreferencesRepo extends BaseSharedPreferencesRepo {
  final TOKEN_KEY = 'TOKEN_KEY';

  Future<void> saveToken(String? token) {
    return saveData(TOKEN_KEY, token);
  }

  String? getToken() {
    return readData(TOKEN_KEY);
  }

  Future<void> clearData() async {
    await Future.wait([
      box.remove(TOKEN_KEY),
    ]);
  }
}
