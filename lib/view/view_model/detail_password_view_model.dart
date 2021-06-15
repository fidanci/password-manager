import 'package:flutter/cupertino.dart';
import 'package:password_manager/core/model/passwrod_model.dart';
import 'package:password_manager/core/service/passwords_database.dart';

class DetailPasswordViewModel extends ChangeNotifier {
  PasswordsDatabase _passwordsDatabase = PasswordsDatabase.instance;
  PasswordModel? passwordModel;
  int? _id;
  int? get getID => _id;
  set setID(int? id) => this._id = id;

  Future<void> getItem(int? id) async {
    passwordModel = await _passwordsDatabase.readPasswordItem(id);
    notifyListeners();
  }
}
