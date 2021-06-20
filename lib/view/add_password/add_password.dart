import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: Text("Password add and edit"),
          elevation: 0,
        ),
        body: Form(
          key: viewModel.formKey,
          child: Center(
            child: Container(
              height: size.height / 2.4,
              width: size.width / 1.1,
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
                children: [
                  Spacer(),
                  Text(
                    "Şifre Kaydet",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFieldWidget(
                    onChanged: (String value) {
                      viewModel.setUsername = value;
                    },
                    hintText: "User Name",
                    obscureText: false,
                  ),
                  TextFieldWidget(
                    initValue: "https://",
                    onChanged: (String value) {
                      viewModel.setPassURL = value;
                    },
                    hintText: "Url",
                    obscureText: false,
                  ),
                  TextFieldWidget(
                    onChanged: (String value) {
                      viewModel.setPassword = value;
                    },
                    hintText: "password",
                    obscureText: viewModel.isObscureText,
                    suffixIcon: GestureDetector(
                      onTap: () => viewModel.changeIsObscure(),
                      child: Icon(
                        viewModel.isObscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    icon: Icon(Icons.save_rounded),
                    label: Text("Şifreyi Kaydet"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white30),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                      fixedSize: MaterialStateProperty.all(
                          Size.fromWidth(size.width / 2)),
                    ),
                    onPressed: () => viewModel.save(
                        context: context,
                        passwordDatabase: viewModel.passwordDatabase),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
