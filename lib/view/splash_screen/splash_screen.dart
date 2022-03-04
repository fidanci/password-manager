import 'package:flutter/material.dart';
import 'package:password_manager/core/constants/enums.dart';
import 'package:password_manager/core/constants/router_constants.dart';
import 'package:password_manager/core/service/storage_service.dart';
import 'package:password_manager/view/login_screen/login_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    StorageService service = StorageService.instance;
    Future.delayed(Duration(seconds: 3))
        .then((value) => route(context, service));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Password Manager",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              CircularProgressIndicator.adaptive(backgroundColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  void route(BuildContext context, StorageService service) {
    service.getValue(type: SharedPreferencesEnum.FIRS_INITIALIZE).then((value) {
      if (value == "true") {
        service.getValue(type: SharedPreferencesEnum.USER_NAME).then((value) {
          context.read<LoginViewModel>().username = value;
          Navigator.pushNamedAndRemoveUntil(
              context, LOGIN_ROUTER, (route) => false);
        });
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, SET_FIRST_PASSWORD, (route) => false);
      }
    });
  }
}
