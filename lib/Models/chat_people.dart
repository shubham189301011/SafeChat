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
            child:
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.left,
              ),
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
