import 'package:flutter/material.dart';
import 'package:password_manager/view/components/edit_view_body_widget.dart';
import 'package:password_manager/view/components/elevated_button_widget.dart';
import 'package:password_manager/view/components/text_field_widget.dart';
import 'package:password_manager/view/add_password/add_passwords_view_model.dart';
import 'package:provider/provider.dart';

class AddPassword extends StatelessWidget {
  const AddPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<AddPasswordsViewModel>(context);
    var size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () => viewModel.popScopeFunction(),
      child: Scaffold(
        body: bodyWidget(size, viewModel, context),
      ),
    );
  }

  Widget bodyWidget(
      Size size, AddPasswordsViewModel viewModel, BuildContext context) {
    return EditScreenBodyWidget(
      height: size.height / 2.4,
      width: size.width / 1.1,
      body: Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            Spacer(),
            titleText,
            usernameTextField(viewModel),
            urlTextField(viewModel),
            passwordTextField(viewModel),
            elevatedSaveButton(viewModel, context),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget get titleText => Text(
        "Şifre Kaydet",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
  Widget usernameTextField(AddPasswordsViewModel viewModel) => TextFieldWidget(
        onChanged: (String value) {
          viewModel.setUsername = value;
        },
        hintText: "User Name",
        obscureText: false,
      );

  Widget urlTextField(AddPasswordsViewModel viewModel) => TextFieldWidget(
        initValue: "https://",
        onChanged: (String value) {
          viewModel.setPassURL = value;
        },
        hintText: "Url",
        obscureText: false,
      );

  Widget passwordTextField(AddPasswordsViewModel viewModel) => TextFieldWidget(
        onChanged: (String value) {
          viewModel.setPassword = value;
        },
        hintText: "password",
        obscureText: viewModel.isObscureText,
        suffixIcon: GestureDetector(
          onTap: () => viewModel.changeIsObscure(),
          child: Icon(
            viewModel.isObscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      );

  Widget elevatedSaveButton(
          AddPasswordsViewModel viewModel, BuildContext context) =>
      ElevatedButtonWidget(
        icon: Icon(Icons.save_rounded),
        text: "Şifreyi Kaydet",
        onPressed: () => viewModel.save(
            context: context, passwordDatabase: viewModel.passwordDatabase),
      );
}
