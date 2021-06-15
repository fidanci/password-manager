import 'package:flutter/material.dart';
import 'package:password_manager/core/constants/router_constants.dart';
import 'package:password_manager/view/components/card_widget.dart';
import 'package:password_manager/view/view_model/detail_password_view_model.dart';
import 'package:password_manager/view/view_model/home_screen_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeScreenViewModel>(context);
    viewModel.refreshPasswords(passwordsDatabase: viewModel.passwordsDatabase);
    return Scaffold(
      appBar: AppBar(
        title: Text('AnaSayfa'),
      ),
      body: buildListView(viewModel: viewModel),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, ADD_PASSWORD),
      ),
    );
  }

  Widget buildListView({required HomeScreenViewModel viewModel}) =>
      RefreshIndicator(
        onRefresh: () => viewModel.refreshPasswords(
            passwordsDatabase: viewModel.passwordsDatabase),
        child: viewModel.passwords.length < 0
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: viewModel.passwords.length,
                itemBuilder: (context, index) => CardWidget(
                  username: viewModel.passwords[index].userName,
                  url: viewModel.passwords[index].passURL,
                  onPressedCopy: () => viewModel.copyWithClipboard(
                      copyText: viewModel.passwords[index].password),
                  onTap: () {
                    context.read<DetailPasswordViewModel>().setID =
                        viewModel.passwords[index].id;
                    Navigator.pushNamed(context, DETAIL_PASSWORD);
                  },
                ),
              ),
      );
}
