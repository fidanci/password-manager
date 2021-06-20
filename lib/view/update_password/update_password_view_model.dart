import 'package:flutter/cupertino.dart';
import 'package:password_manager/core/model/passwrod_model.dart';
import 'package:password_manager/core/service/passwords_database.dart';

class UpdatePasswordViewModel extends ChangeNotifier {
  PasswordsDatabase _passwordsDatabase = PasswordsDatabase.instance;
  final formKey = GlobalKey<FormState>();
  PasswordModel? passwordModel;
  int? _id;
  bool isObscureText = true;

  int? get getID => _id;
  set setID(int? id) => this._id = id;

  Future<void> getItem(int? id) async {
    passwordModel = await _passwordsDatabase.readPasswordItem(id);
    notifyListeners();
  }

  Future<bool> updatePassword(
      BuildContext context, PasswordModel passwordModel) async {
    var isUpdate = await _passwordsDatabase.updatePassword(passwordModel);
    if (isUpdate) {
      Navigator.pop(context);
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  void fillTextField(int? id) async {
    await getItem(id).then((value) {});
  }

  void changeIsObscure() {
    this.isObscureText = !isObscureText;
    notifyListeners();
  }
}
