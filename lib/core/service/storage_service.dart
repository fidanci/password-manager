import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:password_manager/core/constants/enums.dart';

abstract class IStorageService {
  setValue({SharedPreferencesEnum? type, String? value});
  getValue({SharedPreferencesEnum? type});
  deleteValue({SharedPreferencesEnum? type});
  getAllValue();
}

class StorageService extends IStorageService {
  static final StorageService _instance = StorageService._init();

  FlutterSecureStorage? _flutterSecureStorage;
  static StorageService get instance => _instance;

  StorageService._init() {
    _flutterSecureStorage = FlutterSecureStorage();
  }

  @override
  Future<Map<String, String>?> getAllValue() async {
    Map<String, String>? allValues = await _flutterSecureStorage?.readAll();
    return allValues;
  }

  @override
  Future<String?> getValue({SharedPreferencesEnum? type}) async {
    return await _flutterSecureStorage?.read(key: type.toString());
  }

  @override
  setValue({SharedPreferencesEnum? type, String? value}) async {
    return await _flutterSecureStorage?.write(
        key: type.toString(), value: value);
  }

  @override
  deleteValue({SharedPreferencesEnum? type}) async {
    return await _flutterSecureStorage?.delete(key: type.toString());
  }
}
