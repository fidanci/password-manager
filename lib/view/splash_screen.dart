import 'package:flutter/material.dart';
import 'package:password_manager/core/constants/enums.dart';
import 'package:password_manager/core/constants/router_constants.dart';
import 'package:password_manager/core/service/storage_service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StorageService service = StorageService.instance;
    Future.delayed(Duration(seconds: 2))
        .then((value) => route(context, service));
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
        Navigator.pushNamedAndRemoveUntil(
            context, LOGIN_ROUTER, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, SET_FIRST_PASSWORD, (route) => false);
      }
    });
  }
}
