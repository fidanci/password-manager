import 'package:password_manager/view/add_password/add_passwords_view_model.dart';
import 'package:password_manager/view/detail_password/detail_password_view_model.dart';
import 'package:password_manager/view/home_screen/home_screen_view_model.dart';
import 'package:password_manager/view/login_screen/login_view_model.dart';
import 'package:password_manager/view/set_first_password/set_password_view_model.dart';
import 'package:password_manager/view/update_password/update_password_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
  ChangeNotifierProvider(create: (_) => SetPasswordViewmodel()),
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ChangeNotifierProvider(create: (_) => AddPasswordsViewModel()),
  ChangeNotifierProvider(create: (_) => DetailPasswordViewModel()),
  ChangeNotifierProvider(create: (_) => UpdatePasswordViewModel()),
];
