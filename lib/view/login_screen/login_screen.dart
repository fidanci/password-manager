import 'package:flutter/material.dart';
import 'package:password_manager/view/components/edit_view_body_widget.dart';
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
      body: bodyWidget(size, viewModel, context),
    );
  }

  EditScreenBodyWidget bodyWidget(
      Size size, LoginViewModel viewModel, BuildContext context) {
    return EditScreenBodyWidget(
      height: size.height / 2.5,
      width: size.width / 1.2,
      body: Form(
        key: viewModel.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleText,
            usernameTextField(viewModel),
            passwordTextField(viewModel),
            loginButton(viewModel, context),
          ],
        ),
      ),
    );
  }

  Text get titleText => Text(
        "Giriş Yap",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget usernameTextField(LoginViewModel viewModel) => TextFieldWidget(
        initValue: "${viewModel.username}",
        onChanged: (String value) {
          viewModel.username = value;
        },
        hintText: "Kullanıcı Adı",
        obscureText: false,
      );

  TextFieldWidget passwordTextField(LoginViewModel viewModel) =>
      TextFieldWidget(
        onChanged: (String value) {
          viewModel.password = value;
        },
        hintText: "Şifre",
        obscureText: true,
        keyboardType: TextInputType.number,
      );

  ElevatedButtonWidget loginButton(
          LoginViewModel viewModel, BuildContext context) =>
      ElevatedButtonWidget(
        icon: Icon(Icons.check),
        text: "Giriş Yap",
        onPressed: () => viewModel.buttonOnPress(
            context: context, service: viewModel.service),
      );
}
