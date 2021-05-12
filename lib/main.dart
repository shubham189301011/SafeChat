import 'package:chatapp/Screens/LoginSignUpScreen.dart';
import 'package:chatapp/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'amplifyconfiguration.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:chatapp/Screens/homePage.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
