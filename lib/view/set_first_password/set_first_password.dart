import 'package:flutter/material.dart';
import 'package:password_manager/view/components/edit_view_body_widget.dart';
import 'package:password_manager/view/components/elevated_button_widget.dart';
import 'package:password_manager/view/components/text_field_widget.dart';
import 'package:password_manager/view/set_first_password/set_password_view_model.dart';
import 'package:provider/provider.dart';

class SetFirstPassword extends StatelessWidget {
  SetFirstPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SetPasswordViewmodel>(context);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: bodyWidget(size, viewModel, context),
    );
  }

  EditScreenBodyWidget bodyWidget(
      Size size, SetPasswordViewmodel viewModel, BuildContext context) {
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
            signUpButton(viewModel, context),
          ],
        ),
      ),
    );
  }

  Text get titleText => Text(
        "Kullanıcı adı ve şifre belirle",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );

  TextFieldWidget usernameTextField(SetPasswordViewmodel viewModel) =>
      TextFieldWidget(
        onChanged: (String value) {
          viewModel.setUsername = value;
        },
        hintText: "Kullanıcı Adı",
        obscureText: false,
      );

  TextFieldWidget passwordTextField(SetPasswordViewmodel viewModel) =>
      TextFieldWidget(
        onChanged: (String value) {
          viewModel.setPassword = value;
        },
        hintText: "Şifre",
        obscureText: true,
        keyboardType: TextInputType.number,
      );

  ElevatedButtonWidget signUpButton(
          SetPasswordViewmodel viewModel, BuildContext context) =>
      ElevatedButtonWidget(
        icon: Icon(Icons.check),
        text: "Kayıt Ol",
        onPressed: () => viewModel.buttonOnPress(
            context: context, service: viewModel.service),
      );
}
