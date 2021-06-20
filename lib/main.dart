import 'package:flutter/material.dart';
import 'package:password_manager/core/routes/router.dart';
import 'package:password_manager/view/splash_screen/splash_screen.dart';
import 'package:password_manager/view/add_password/add_passwords_view_model.dart';
import 'package:password_manager/view/detail_password/detail_password_view_model.dart';
import 'package:password_manager/view/login_screen/login_view_model.dart';
import 'package:password_manager/view/home_screen/home_screen_view_model.dart';
import 'package:password_manager/view/set_first_password/set_password_view_model.dart';
import 'package:password_manager/view/update_password/update_password_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
      ChangeNotifierProvider(create: (_) => SetPasswordViewmodel()),
      ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ChangeNotifierProvider(create: (_) => AddPasswordsViewModel()),
      ChangeNotifierProvider(create: (_) => DetailPasswordViewModel()),
      ChangeNotifierProvider(create: (_) => UpdatePasswordViewModel()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PasswordManager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      onGenerateRoute: Routers.generateRoute,
      home: SplashScreen(),
    );
  }
}
