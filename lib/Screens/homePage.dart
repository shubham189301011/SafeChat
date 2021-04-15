import 'package:chatapp/Screens/LoginSignUpScreen.dart';
import 'package:chatapp/main.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Screens/chatPage.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:chatapp/Screens/homePage.dart';

class HomePage extends StatefulWidget {
  //static String id = 'homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: GestureDetector(
          onTap: () {
            setState(() {
              try {
                Amplify.Auth.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginSignUp(),
                ));
                //Navigator.pushNamed(context, MaterialPageRoute(builder: (context) => MyApp()));
                // Navigator.popAndPushNamed(context, MaterialPageRoute(
                //   builder: (context) => LoginSignUp()),
                // );
              } on AuthException catch (e) {
                print(e.message);
              }
            });
          },
          child: Icon(Icons.logout),
        ),
      ),
      body: ChatPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text("Chats"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts_rounded),
            title: Text("Contacts"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
}
