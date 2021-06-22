import 'package:flutter/material.dart';
import 'package:password_manager/core/constants/router_constants.dart';
import 'package:password_manager/view/add_password/add_password.dart';
import 'package:password_manager/view/detail_password/detail_password_screen.dart';
import 'package:password_manager/view/home_screen/home_screen.dart';
import 'package:password_manager/view/login_screen/login_screen.dart';
import 'package:password_manager/view/set_first_password/set_first_password.dart';
import 'package:password_manager/view/settings_screen/setting_screen.dart';
import 'package:password_manager/view/update_password/update_password.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_ROUTER:
        return MaterialPageRoute(builder: (_) => LoginPasswordScreen());
      case SET_FIRST_PASSWORD:
        return MaterialPageRoute(builder: (_) => SetFirstPassword());
      case HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case ADD_PASSWORD:
        return MaterialPageRoute(builder: (_) => AddPassword());
      case DETAIL_PASSWORD:
        return MaterialPageRoute(builder: (_) => DetailPasswordScreen());
      case UPDATE_PASSWORD:
        return MaterialPageRoute(builder: (_) => UpdatePassword());
      case SETTING_SCREEN:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
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
