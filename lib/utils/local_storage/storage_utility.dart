import 'package:get_storage/get_storage.dart';

class VLocalStorage {
  static final VLocalStorage _instance = VLocalStorage._internal();
  final _storage = GetStorage();

  factory VLocalStorage() {
    return _instance;
  }

  VLocalStorage._internal();

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

// Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
