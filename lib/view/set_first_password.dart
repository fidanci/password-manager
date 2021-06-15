import 'package:flutter/material.dart';
import 'package:password_manager/view/components/elevated_button_widget.dart';
import 'package:password_manager/view/components/text_field_widget.dart';
import 'package:password_manager/view/view_model/set_password_view_model.dart';
import 'package:provider/provider.dart';

class SetFirstPassword extends StatelessWidget {
  SetFirstPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SetPasswordViewmodel>(context);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Uygulamaya girmek için  kullanıcı adı ve şifre belirle",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFieldWidget(
                controller: viewModel.usernameController,
                hintText: "Kullanıcı Adı",
                obscureText: false,
              ),
              TextFieldWidget(
                controller: viewModel.passwordController,
                hintText: "Şifre",
                obscureText: true,
                keyboardType: TextInputType.number,
              ),
              ElevatedButtonWidget(
                icon: Icon(Icons.check),
                text: "Kayıt Ol",
                onPressed: () => viewModel.buttonOnPress(
                    context: context, service: viewModel.service),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
