import 'package:flutter/material.dart';
import 'package:password_manager/view/components/detail_screen_card_design.dart';
import 'package:password_manager/view/detail_password/detail_password_view_model.dart';
import 'package:provider/provider.dart';

class DetailPasswordScreen extends StatelessWidget {
  const DetailPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<DetailPasswordViewModel>(context);
    viewModel.getItem(viewModel.getID);
    return Scaffold(
      appBar: appBar(viewModel, context),
      body: bodyWidget(viewModel),
    );
  }

  AppBar appBar(DetailPasswordViewModel viewModel, BuildContext context) =>
      AppBar(
        title: Text("Detail Screen"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              viewModel.deleteItem(viewModel.passwordModel?.id, context);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => viewModel.navigateUpdatePassword(
              context,
              viewModel.passwordModel!.id,
            ),
          ),
        ],
      );

  Widget bodyWidget(DetailPasswordViewModel viewModel) => Container(
        child: Card(
          child: ListView(
            children: [
              urlCard(viewModel),
              usernameCard(viewModel),
              passwordCard(viewModel),
            ],
          ),
        ),
      );

  Widget urlCard(DetailPasswordViewModel viewModel) => DetailCardWidget(
        title: "Name/Url",
        subTitle: viewModel.passwordModel?.passURL,
        isObscureText: false,
        suffixIcon: GestureDetector(
          onTap: () =>
              viewModel.launchInBrowser("${viewModel.passwordModel?.passURL}"),
          child: Icon(
            Icons.open_in_browser,
          ),
        ),
      );

  Widget usernameCard(DetailPasswordViewModel viewModel) => DetailCardWidget(
        title: "Username/E-mail",
        subTitle: viewModel.passwordModel?.userName,
        isObscureText: false,
        suffixIcon: GestureDetector(
          onTap: () => viewModel.copyWithClipboard(
              copyText: "${viewModel.passwordModel?.userName}"),
          child: Icon(Icons.copy),
        ),
      );

  Widget passwordCard(DetailPasswordViewModel viewModel) => GestureDetector(
        onLongPress: () => viewModel.copyWithClipboard(
            copyText: "${viewModel.passwordModel?.password}"),
        child: DetailCardWidget(
          title: "Password",
          subTitle: viewModel.passwordModel?.password,
          isObscureText: viewModel.isObscureText,
          suffixIcon: GestureDetector(
            onTap: () => viewModel.changeIsObscure(),
            child: Icon(
              viewModel.isObscureText ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      );
}
