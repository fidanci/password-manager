import 'package:flutter/material.dart';
import 'package:password_manager/core/constants/provider_constants.dart';
import 'package:password_manager/core/routes/router.dart';
import 'package:password_manager/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: providers, child: MyApp()));

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
