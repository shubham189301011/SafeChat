import 'package:chatapp/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Screens/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapp/Screens/homePage.dart';

final _auth = FirebaseAuth.instance;
String userName;
String _chosenValue;
class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _firestore = Firestore.instance;

  FirebaseUser loggedInUser;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        //userId = loggedInUser.uid;
      }
      print(loggedInUser);
    } catch (e) {
      print(e);
    }
  }

  void getProfileName() async {
    final users = await _firestore.collection('users').getDocuments();
    //print(data.documents);
    getCurrentUser();
    for (var user in users.documents) {
      if (user.data['uid'] == loggedInUser.uid) {
        setState(() {
          userName = user.data['name'];
          print(user.data['name']);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();

    getCurrentUser();
    getProfileName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  //getProfileName();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
                }),
          ],
          title: Text('Profile'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
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
                  userName[0],
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Text(userName,
              style: new TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 25,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 10),
              child: new Text(
                'Status:',
                style: new TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 25,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          Container(
            width: 350,
            height: 60,
            padding: const EdgeInsets.all(0.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: _chosenValue,
              //elevation: 5,
              style: TextStyle(color: Colors.black,
              fontSize: 20),

              items: <String>[
                'Available',
                'Busy',
                'At School',
                'At the movies',
                'At work',
                'Battery About To Die',
                'Cant talk, SafeChat only',
                'In a meeting',
                'At the gym',
                'Sleeping',
                'Urgent Calls only'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text(
                "Please select a status",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              onChanged: (String value) {
                setState(() {
                  _chosenValue = value;
                });
              },
            ),)
          ],
        )));
  }
}
