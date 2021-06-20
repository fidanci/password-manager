import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:password_manager/core/model/passwrod_model.dart';
import 'package:password_manager/core/service/passwords_database.dart';

class HomeScreenViewModel extends ChangeNotifier {
  PasswordsDatabase _passwordsDatabase = PasswordsDatabase.instance;
  List<PasswordModel> passwords = [];

  PasswordsDatabase get passwordsDatabase => _passwordsDatabase;

  Future<void> refreshPasswords(
      {required PasswordsDatabase passwordsDatabase}) async {
    passwords = await passwordsDatabase.readAllPasswordItem();
    notifyListeners();
  }

  void copyWithClipboard({String? copyText}) {
    try {
      Clipboard.setData(new ClipboardData(text: "$copyText"));
    } catch (e) {
      print(e.toString());
    }
  }
}
