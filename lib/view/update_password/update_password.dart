import 'package:flutter/material.dart';
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
      body: Center(
        child: Container(
          height: size.height / 2.3,
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
          child: Form(
            key: viewModel.formKey,
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
                  initValue: viewModel.passwordModel?.userName,
                  onChanged: (String val) =>
                      viewModel.passwordModel?.userName = val,
                  hintText: "Username",
                  obscureText: false,
                ),
                TextFieldWidget(
                  initValue: viewModel.passwordModel?.passURL,
                  onChanged: (String val) =>
                      viewModel.passwordModel?.passURL = val,
                  hintText: "Url",
                  obscureText: false,
                ),
                TextFieldWidget(
                  initValue: viewModel.passwordModel?.password,
                  onChanged: (String val) =>
                      viewModel.passwordModel?.password = val,
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
                    backgroundColor: MaterialStateProperty.all(Colors.white30),
                    shape: MaterialStateProperty.all(StadiumBorder()),
                    fixedSize: MaterialStateProperty.all(
                        Size.fromWidth(size.width / 2)),
                  ),
                  onPressed: () => viewModel.updatePassword(
                      context, viewModel.passwordModel!),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
