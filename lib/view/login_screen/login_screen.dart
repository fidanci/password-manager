import 'package:flutter/material.dart';
import 'package:password_manager/view/components/elevated_button_widget.dart';
import 'package:password_manager/view/components/text_field_widget.dart';
import 'package:password_manager/view/login_screen/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPasswordScreen extends StatelessWidget {
  LoginPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LoginViewModel>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height / 2.5,
          width: size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 1.5),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Giriş Yap",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFieldWidget(
                  initValue: "${viewModel.username}",
                  onChanged: (String value) {
                    // viewModel.username = value;
                    print(value);
                  },
                  hintText: "Kullanıcı Adı",
                  obscureText: false,
                ),
                TextFieldWidget(
                  onChanged: (String value) {
                    viewModel.password = value;
                  },
                  hintText: "Şifre",
                  obscureText: true,
                  keyboardType: TextInputType.number,
                ),
                ElevatedButtonWidget(
                  icon: Icon(Icons.check),
                  text: "Giriş Yap",
                  onPressed: () => viewModel.buttonOnPress(
                      context: context, service: viewModel.service),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
