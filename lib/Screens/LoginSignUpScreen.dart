import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:chatapp/Screens/login_screen.dart';
import 'package:chatapp/Screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';
import '../amplifyconfiguration.dart';
import 'package:chatapp/theme.dart';
import 'homePage.dart';

class LoginSignUp extends StatefulWidget {
  //static String id = 'loginsignup';
  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  bool _amplifyConfigured = false;

  // Instantiate Amplify
  final _amplifyInstance = Amplify;

  // controllers for text input
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isSignUpComplete = false;
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();

    // amplify is configured on startup
    _configureAmplify();
    Amplify.Auth.signOut();
    // loggedInUser = "qUQHyNnqlZN71cQairtQ5WdO5Zi1" as dynamic;
    // print(loggedInUser.email);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void _configureAmplify() async {
    if (!mounted) return;

    // add all of the plugins we are currently using
    // in our case... just one - Auth
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    _amplifyInstance.addPlugin(authPlugin);

    await _amplifyInstance.configure(amplifyconfig);
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<String> _signUp(LoginData data) async {
    try {
      Map<String, String> userAttributes = {
        "email": emailController.text,
      };
      SignUpResult res = await Amplify.Auth.signUp(
          username: data.name,
          password: data.password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));
      setState(() {
        isSignUpComplete = res.isSignUpComplete;
        print("Sign up: " + (isSignUpComplete ? "Complete" : "Not Complete"));
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => RegistrationScreen(),
        ));
      });
    } catch (e) {
      print(e);
      return "Register Error: " + e.toString();
    }
  }

  Future<String> _signIn(LoginData data) async {
    try {
      SignInResult res = await Amplify.Auth.signIn(
        username: data.name,
        password: data.password,
      );
      setState(() {
        isSignedIn = res.isSignedIn;
        print("Sign in: " + (isSignedIn ? "Complete" : "Not Complete"));
        if (isSignedIn) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => RegistrationScreen(),
          ));
          //Navigator.popAndPushNamed(context, HomePage.id);
        } else {
          print("Cannot Login");
        }
      });
    } catch (e) {
      print(e);
      return 'Log In Error: ' + e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SafeChat'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.brightness_6),
            color: Colors.white,
            onPressed:(){
              ThemeProvider themeProvider = Provider.of<ThemeProvider>(context,
                  listen: false);
              themeProvider.swapTheme();
            },
          )
        ],
      ),
        body: SafeArea(
      child: FlutterLogin(
        title: 'SafeChat',
        logo: 'assets/icon.png',
        onLogin: _signIn,
        onSignup: _signUp,
        onRecoverPassword: (_) => null,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
        },
        //   onRecoverPassword: _recoverPassword,
      ),
    ));
  }
}
