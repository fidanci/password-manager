import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_manager/core/constants/router_constants.dart';
import 'package:password_manager/core/model/passwrod_model.dart';
import 'package:password_manager/core/service/passwords_database.dart';
import 'package:password_manager/view/update_password/update_password_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPasswordViewModel extends ChangeNotifier {
  PasswordsDatabase _passwordsDatabase = PasswordsDatabase.instance;
  PasswordModel? passwordModel;
  int? _id;
  bool isObscureText = true;

  int? get getID => _id;
  set setID(int? id) => this._id = id;

  Future<void> getItem(int? id) async {
    passwordModel = await _passwordsDatabase.readPasswordItem(id);
    notifyListeners();
  }

  Future<bool> deleteItem(int? id, BuildContext context) async {
    var isDelete = await _passwordsDatabase.deletePassword(id!);
    if (isDelete) {
      Navigator.pop(context);
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  void navigateUpdatePassword(BuildContext context, int? id) {
    context.read<UpdatePasswordViewModel>().passwordModel = passwordModel;
    Navigator.pushNamed(context, UPDATE_PASSWORD);
  }

  Future<void> launchInBrowser(String? url) async {
    if (await canLaunch(url!)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  void copyWithClipboard({String? copyText}) {
    try {
      Clipboard.setData(new ClipboardData(text: "$copyText"))
          .then((value) => print("kopyalandı"));
    } catch (e) {
      print(e.toString());
    }
  }

  void changeIsObscure() {
    this.isObscureText = !isObscureText;
    notifyListeners();
  }
}
