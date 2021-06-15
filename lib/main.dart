import 'package:flutter/material.dart';
import 'package:password_manager/core/routes/router.dart';
import 'package:password_manager/view/splash_screen.dart';
import 'package:password_manager/view/view_model/add_passwords_view_model.dart';
import 'package:password_manager/view/view_model/detail_password_view_model.dart';
import 'package:password_manager/view/view_model/login_view_model.dart';
import 'package:password_manager/view/view_model/home_screen_view_model.dart';
import 'package:password_manager/view/view_model/set_password_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
      ChangeNotifierProvider(create: (_) => SetPasswordViewmodel()),
      ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ChangeNotifierProvider(create: (_) => AddPasswordsViewModel()),
      ChangeNotifierProvider(create: (_) => DetailPasswordViewModel()),
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
