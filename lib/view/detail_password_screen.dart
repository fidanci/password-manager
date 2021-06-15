import 'package:flutter/material.dart';
import 'package:password_manager/view/view_model/detail_password_view_model.dart';
import 'package:provider/provider.dart';

class DetailPasswordScreen extends StatelessWidget {
  const DetailPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<DetailPasswordViewModel>(context);
    viewModel.getItem(viewModel.getID);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
      ),
      body: Container(
        child: Card(
          child: ListView(
            children: [
              Text("Name/URL : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text(
                  "Username/E-mail ${viewModel.passwordModel?.userName ?? "asdasdasdas"}"),
              Text(
                  "Password ${viewModel.passwordModel?.password ?? "asdasdasdas"}"),
            ],
          ),
        ),
      ),
    );
  }
}
