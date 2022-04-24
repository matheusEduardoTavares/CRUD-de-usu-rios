import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_crud_example/app/core/local_storage/local_storage.dart';

class SharedPreferencesLocalStorageImpl implements LocalStorage {
  Future<SharedPreferences> get _instance => SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final sharedPreferencesInstance = await _instance;
    await sharedPreferencesInstance.clear();
  }

  @override
  Future<bool> contains(String key) async {
    final sharedPreferencesInstance = await _instance;
    return sharedPreferencesInstance.containsKey(key);
  }

  @override
  Future<String?> read(String key) async {
    final sharedPreferencesInstance = await _instance;
    return sharedPreferencesInstance.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    final sharedPreferencesInstance = await _instance;
    await sharedPreferencesInstance.remove(key);
  }

  @override
  Future<void> write(String key, String value) async {
    final sharedPreferencesInstance = await _instance;
    await sharedPreferencesInstance.setString(key, value);
  }
  
}