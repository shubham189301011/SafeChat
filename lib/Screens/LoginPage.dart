import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'homePage.dart';


final _auth= AmplifyAuthCognito();
String email;
String password;
const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) async {
    try{
      print('Email: ${data.name}, Password: ${data.password}');
      return Future.delayed(loginTime).then((_) {
        if (!users.containsKey(data.name)) {
          return 'Username not exists';
        }
        if (users[data.name] != data.password) {
          return 'Password does not match';
        }
        return null;
      });
    }on AuthError catch(e)
    {
      return e.toString();
    }
    }


  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FlutterLogin(
        title: 'ChatApp',
        logo: 'assets/icon.png',
        onLogin: _authUser,
        //onSignup: _registerUser,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
        },
        onRecoverPassword: _recoverPassword,
      ),
    );
  }
}