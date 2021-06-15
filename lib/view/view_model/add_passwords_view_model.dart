import 'package:flutter/material.dart';
import 'package:password_manager/core/model/passwrod_model.dart';
import 'package:password_manager/core/service/passwords_database.dart';

class AddPasswordsViewModel extends ChangeNotifier {
  PasswordsDatabase _passwordDatabase = PasswordsDatabase.instance;
  late PasswordModel _passwordModel;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passURLController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  PasswordsDatabase get passwordDatabase => _passwordDatabase;
  PasswordModel get getPasswordModel => _passwordModel;
  set setPasswordModel(PasswordModel passwordModel) {
    _passwordModel = passwordModel;
    notifyListeners();
  }

  TextEditingController get usernameController => _usernameController;
  TextEditingController get passURLController => _passURLController;
  TextEditingController get passwordController => _passwordController;

  void save(
      {required BuildContext context,
      required PasswordsDatabase passwordDatabase}) async {
    if (usernameController.text.isNotEmpty &&
        passURLController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      await passwordDatabase
          .insert(PasswordModel(
              userName: usernameController.text,
              passURL: passURLController.text,
              password: passwordController.text))
          .then((value) {
        if (value) {
          Navigator.pop(context);
          textClear();
        } else {
          print("kaydedilemedi");
        }
      });
    }
  }

  void textClear() {
    usernameController.clear();
    passURLController.clear();
    passwordController.clear();
  }
}
