import 'package:flutter/material.dart';
import 'package:password_manager/view/components/edit_view_body_widget.dart';
import 'package:password_manager/view/components/pin_code_widget.dart';
import 'package:password_manager/view/login_screen/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LoginViewModel>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: EditScreenBodyWidget(
        height: size.height / 3,
        width: size.width / 1.1,
        body: bodyWidget(viewModel, context, size),
      ),
    );
  }

  Form bodyWidget(LoginViewModel viewModel, BuildContext context, Size size) {
    return Form(
      key: viewModel.formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleText(viewModel),
            SizedBox(height: size.height * .06),
            PinCodeWidget(
              pinChanged: viewModel.password,
              onCompleted: (String v) {
                viewModel.complatePassword(
                    context: context, service: viewModel.service);
              },
            ),
          ],
        ),
      ),
    );
  }

  Text titleText(LoginViewModel viewModel) => Text(
        "Hoşgeldin ${viewModel.username}!",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
}
