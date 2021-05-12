import 'package:chatapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Screens/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapp/Screens/homePage.dart';
final _auth = FirebaseAuth.instance;
class ProfileView extends StatelessWidget {
  String username;
  ProfileView(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  //print(friendId);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
                  //print(loggedInUser.uid);
                  //messagesStream();
                  //getMessages();
                  //_auth.signOut();
                  //Navigator.pop(context);
                }),
          ],
          title: Text('Profile'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height:  100,
                ),
                Container(
                  width: 150.0,
                  height: 150.0,
                  margin: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      username[0],
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:   100,
                          color: Colors.white),
                        textAlign: TextAlign.center,
                    ),
                  ),
                  ),
                Text("Username:"+username,
                    style: new TextStyle(
                        fontWeight: FontWeight.normal,
                    fontSize: 25,
                    color: Colors.black),
          textAlign: TextAlign.center,),

                new Padding(
                  padding: new EdgeInsets.only(top: 10),
                  child: new Text(
                    'Status: Busy',
                    style: new TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 25,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )));
  }
}