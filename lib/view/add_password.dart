import 'package:flutter/material.dart';
import 'package:password_manager/view/view_model/add_passwords_view_model.dart';
import 'package:provider/provider.dart';

class AddPassword extends StatelessWidget {
  const AddPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<AddPasswordsViewModel>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Password add and edit"),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          height: size.height / 2.4,
          width: size.width / 1.1,
          decoration: BoxDecoration(
            //   color: Colors.white,
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
                    //  color: Colors.blue[300],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              textField(
                controller: viewModel.usernameController,
                hintText: "User Name",
              ),
              textField(
                controller: viewModel.passURLController,
                hintText: "Url",
              ),
              textField(
                controller: viewModel.passwordController,
                hintText: "password",
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.save_rounded),
                label: Text("Şifreyi Kaydet"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white30),
                  shape: MaterialStateProperty.all(StadiumBorder()),
                  fixedSize:
                      MaterialStateProperty.all(Size.fromWidth(size.width / 2)),
                ),
                onPressed: () => viewModel.save(
                    context: context,
                    passwordDatabase: viewModel.passwordDatabase),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(
      {TextEditingController? controller,
      String? hintText,
      bool obscureText = false,
      TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: hintText,
        ),
      ),
    );
  }
}
