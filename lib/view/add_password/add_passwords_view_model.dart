import 'package:flutter/material.dart';
import 'package:password_manager/core/model/passwrod_model.dart';
import 'package:password_manager/core/service/passwords_database.dart';

class AddPasswordsViewModel extends ChangeNotifier {
  PasswordsDatabase _passwordDatabase = PasswordsDatabase.instance;
  final formKey = GlobalKey<FormState>();
  String? _username;
  String? _passURL;
  String? _password;

  String? get getUsername => _username;
  String? get getPassURL => _passURL;
  String? get getPassword => _password;

  set setUsername(String? username) => this._username = username;
  set setPassword(String? password) => this._password = password;
  set setPassURL(String? passURL) => this._passURL = passURL;

  bool isObscureText = true;
  PasswordsDatabase get passwordDatabase => _passwordDatabase;

  void save(
      {required BuildContext context,
      required PasswordsDatabase passwordDatabase}) async {
    if (formKey.currentState!.validate()) {
      await passwordDatabase
          .insert(
        PasswordModel(
          userName: getUsername,
          passURL: getPassURL,
          password: getPassword,
        ),
      )
          .then((value) {
        if (value) {
          Navigator.pop(context);
          textClear();
        } else {
          debugPrint("kaydedilemedi");
        }
      });
    } else {
      print("boş");
    }
  }

  Future<bool> popScopeFunction() async {
    textClear();

    debugPrint("textler silindi, geri dönüldü");
    return true;
  }

  void textClear() {
    _username = null;
    _passURL = null;
    _password = null;
  }

  void changeIsObscure() {
    this.isObscureText = !isObscureText;
    notifyListeners();
  }
}
