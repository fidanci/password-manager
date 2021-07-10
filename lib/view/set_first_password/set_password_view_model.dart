import 'package:flutter/material.dart';
import 'package:password_manager/core/constants/enums.dart';
import 'package:password_manager/core/constants/router_constants.dart';
import 'package:password_manager/core/service/storage_service.dart';

class SetPasswordViewmodel extends ChangeNotifier {
  StorageService _service = StorageService.instance;
  final formKey = GlobalKey<FormState>();
  String? username;
  String? password;

  StorageService get service => _service;

  void buttonOnPress(
      {required BuildContext context, required StorageService service}) {
    if (!formKey.currentState!.validate()) {
      debugPrint("boş amk");
    } else {
      try {
        service.setValue(
            type: SharedPreferencesEnum.USER_NAME, value: username);
        service.setValue(type: SharedPreferencesEnum.PASSWORD, value: password);
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
