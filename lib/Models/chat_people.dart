import 'package:chatapp/Screens/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatPeople extends StatelessWidget {
  final name;
  final usrId;

  ChatPeople({this.name, this.usrId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => ChatScreen(
                friendUid: usrId,
              ),
            ));
          },
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.pinkAccent,
                  ),
                  child: Center(
                    child: Text(
                      '${name[0]}',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.black12,
        ),
      ],
    );
  }
}
