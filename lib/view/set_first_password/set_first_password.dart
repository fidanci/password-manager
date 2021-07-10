import 'package:flutter/material.dart';
import 'package:password_manager/view/components/edit_view_body_widget.dart';
import 'package:password_manager/view/components/pin_code_widget.dart';
import 'package:password_manager/view/components/text_field_widget.dart';
import 'package:password_manager/view/set_first_password/set_password_view_model.dart';
import 'package:provider/provider.dart';

class SetFirstPassword extends StatelessWidget {
  const SetFirstPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SetPasswordViewmodel>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: EditScreenBodyWidget(
        height: size.height / 2.4,
        width: size.width / 1.2,
        body: Form(
          key: viewModel.formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                titleText,
                SizedBox(height: size.height * .06),
                usernameTextField(viewModel),
                PinCodeWidget(
                  pinChanged: viewModel.password,
                  onCompleted: (v) {
                    viewModel.buttonOnPress(
                        context: context, service: viewModel.service);
                  },
                ),
              ],
            ),
          ),
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
          viewModel.username = value;
        },
        hintText: "Kullanıcı Adı",
        obscureText: false,
      );
}
