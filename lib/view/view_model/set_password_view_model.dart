import 'package:flutter/material.dart';
import 'package:password_manager/core/constants/enums.dart';
import 'package:password_manager/core/constants/router_constants.dart';
import 'package:password_manager/core/service/storage_service.dart';

class SetPasswordViewmodel extends ChangeNotifier {
  StorageService _service = StorageService.instance;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  StorageService get service => _service;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;

  void buttonOnPress(
      {required BuildContext context, required StorageService service}) {
    if (usernameController.text.isEmpty && passwordController.text.isEmpty) {
      debugPrint("boş amk");
    } else {
      try {
        service.setValue(
            type: SharedPreferencesEnum.USER_NAME,
            value: usernameController.text);
        service.setValue(
            type: SharedPreferencesEnum.PASSWORD,
            value: passwordController.text);
        service.setValue(
            type: SharedPreferencesEnum.FIRS_INITIALIZE,
            value: true.toString());
        service.getAllValue().then((value) {
          value?.forEach((key, value) {
            debugPrint(key + "  " + value);
          });
        });
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        Navigator.pushNamedAndRemoveUntil(
            context, LOGIN_ROUTER, (route) => false);
      }
    }
  }
}
