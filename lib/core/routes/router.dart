import 'package:flutter/material.dart';
import 'package:password_manager/core/constants/router_constants.dart';
import 'package:password_manager/view/add_password.dart';
import 'package:password_manager/view/detail_password_screen.dart';
import 'package:password_manager/view/home_screen.dart';
import 'package:password_manager/view/login_page.dart';
import 'package:password_manager/view/set_first_password.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_ROUTER:
        return MaterialPageRoute(builder: (_) => LoginPasswordPage());
      case SET_FIRST_PASSWORD:
        return MaterialPageRoute(builder: (_) => SetFirstPassword());
      case HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case ADD_PASSWORD:
        return MaterialPageRoute(builder: (_) => AddPassword());
      case DETAIL_PASSWORD:
        return MaterialPageRoute(builder: (_) => DetailPasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Ters giden birşeyler oldu'),
            ),
          ),
        );
    }
  }
}
