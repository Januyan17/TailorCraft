import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailorcraft/GetXControllers/cartController.dart';
import 'package:tailorcraft/Screens/Authentication/SignIn.dart';
import 'package:tailorcraft/Screens/BottomNavigation/BottomNavigation.dart';
import 'package:tailorcraft/SplashScreen/SplashScreen.dart';

// int initScreen;
var token;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  token = localStorage.getString('token');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: token != null ? BottomNavigationScreen() : SplashScreenWrapper(),
    );
  }
}

class SplashScreenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkIfLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SignInScreen();
        } else {
          if (snapshot.data == true) {
            return BottomNavigationScreen();
          } else {
            return SignInScreen();
          }
        }
      },
    );
  }

  Future<bool> _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    return token != null;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
