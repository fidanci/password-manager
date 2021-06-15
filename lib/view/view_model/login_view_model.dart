import 'package:flutter/cupertino.dart';
import 'package:password_manager/core/constants/enums.dart';
import 'package:password_manager/core/constants/router_constants.dart';
import 'package:password_manager/core/service/storage_service.dart';

class LoginViewModel extends ChangeNotifier {
  StorageService _service = StorageService.instance;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  StorageService get service => _service;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;

  void initPage() {
    service
        .getValue(type: SharedPreferencesEnum.USER_NAME)
        .then((value) => usernameController.text = value.toString());
  }

  void buttonOnPress(
      {required BuildContext context, required StorageService service}) {
    if (usernameController.text.isEmpty && passwordController.text.isEmpty) {
      debugPrint("boş amk");
    } else {
      try {
        service.getValue(type: SharedPreferencesEnum.PASSWORD).then((value) {
          if (value == passwordController.text) {
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
