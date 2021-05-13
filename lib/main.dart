import 'package:chatapp/Screens/LoginSignUpScreen.dart';
import 'package:chatapp/Screens/login_screen.dart';
import 'package:chatapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:provider/provider.dart';
import 'amplifyconfiguration.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:chatapp/Screens/homePage.dart';
import 'package:chatapp/Screens/registration_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      child:MyApp(),
      create: (BuildContext context)=>ThemeProvider(isDarkMode: true),
  ),);

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context,themeProvider,child){
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.getTheme,
        home: LoginSignUp(),
        );
      },
    );
  }
}
