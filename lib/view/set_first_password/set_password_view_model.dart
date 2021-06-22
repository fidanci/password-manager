import 'package:flutter/material.dart';
import 'package:password_manager/core/constants/enums.dart';
import 'package:password_manager/core/constants/router_constants.dart';
import 'package:password_manager/core/service/storage_service.dart';

class SetPasswordViewmodel extends ChangeNotifier {
  StorageService _service = StorageService.instance;
  final formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  String? get getUsername => _username;
  String? get getPassword => _password;
  StorageService get service => _service;

  set setUsername(String? username) => this._username = username;
  set setPassword(String? password) => this._password = password;

  void buttonOnPress(
      {required BuildContext context, required StorageService service}) {
    if (!formKey.currentState!.validate()) {
      debugPrint("boş amk");
    } else {
      try {
        service.setValue(
            type: SharedPreferencesEnum.USER_NAME, value: _username);
        service.setValue(
            type: SharedPreferencesEnum.PASSWORD, value: _password);
        service.setValue(
            type: SharedPreferencesEnum.FIRS_INITIALIZE,
            value: true.toString());
        service.getAllValue();
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        Navigator.pushNamedAndRemoveUntil(
            context, LOGIN_ROUTER, (route) => false);
      }
    }
  }
}
