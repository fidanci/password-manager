import 'package:flutter/material.dart';
import 'package:password_manager/core/constants/enums.dart';
import 'package:password_manager/core/constants/router_constants.dart';
import 'package:password_manager/core/service/storage_service.dart';

class LoginViewModel extends ChangeNotifier {
  StorageService _service = StorageService.instance;
  final formKey = GlobalKey<FormState>();
  String? username;
  String? password;

  StorageService get service => _service;

  void complatePassword(
      {required BuildContext context, required StorageService service}) {
    if (!formKey.currentState!.validate()) {
      debugPrint("boş amk");
    } else {
      try {
        service.getValue(type: SharedPreferencesEnum.PASSWORD).then((value) {
          if (value == password) {
            debugPrint("Şifre Doğru");
            Navigator.pushNamedAndRemoveUntil(
                context, HOME_SCREEN, (route) => false);
          } else {
            debugPrint("şifre yanlış amk");
          }
        });
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
