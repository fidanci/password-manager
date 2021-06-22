import 'package:flutter/material.dart';
import 'package:password_manager/view/components/edit_view_body_widget.dart';
import 'package:password_manager/view/components/text_field_widget.dart';
import 'package:password_manager/view/update_password/update_password_view_model.dart';
import 'package:provider/provider.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<UpdatePasswordViewModel>(context);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("update password"),
      ),
      body: bodyWidget(size, viewModel, context),
    );
  }

  EditScreenBodyWidget bodyWidget(
      Size size, UpdatePasswordViewModel viewModel, BuildContext context) {
    return EditScreenBodyWidget(
      height: size.height / 2.3,
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
            saveButton(size, viewModel, context),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Text get titleText => Text(
        "Şifre Kaydet",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );

  TextFieldWidget usernameTextField(UpdatePasswordViewModel viewModel) =>
      TextFieldWidget(
        initValue: viewModel.passwordModel?.userName,
        onChanged: (String val) => viewModel.passwordModel?.userName = val,
        hintText: "Username",
        obscureText: false,
      );

  TextFieldWidget urlTextField(UpdatePasswordViewModel viewModel) =>
      TextFieldWidget(
        initValue: viewModel.passwordModel?.passURL,
        onChanged: (String val) => viewModel.passwordModel?.passURL = val,
        hintText: "Url",
        obscureText: false,
      );

  TextFieldWidget passwordTextField(UpdatePasswordViewModel viewModel) =>
      TextFieldWidget(
        initValue: viewModel.passwordModel?.password,
        onChanged: (String val) => viewModel.passwordModel?.password = val,
        hintText: "password",
        obscureText: viewModel.isObscureText,
        suffixIcon: GestureDetector(
          onTap: () => viewModel.changeIsObscure(),
          child: Icon(
            viewModel.isObscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      );

  ElevatedButton saveButton(
          Size size, UpdatePasswordViewModel viewModel, BuildContext context) =>
      ElevatedButton.icon(
        icon: Icon(Icons.save_rounded),
        label: Text("Şifreyi Kaydet"),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white30),
          shape: MaterialStateProperty.all(StadiumBorder()),
          fixedSize: MaterialStateProperty.all(Size.fromWidth(size.width / 2)),
        ),
        onPressed: () =>
            viewModel.updatePassword(context, viewModel.passwordModel!),
      );
}
