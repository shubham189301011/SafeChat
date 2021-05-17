import 'package:chatapp/Screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

final key = encrypt.Key.fromLength(32);
final iv = encrypt.IV.fromLength(16);

final encrypter = encrypt.Encrypter(encrypt.AES(key));
var encrypted;
var decrypted;
var encryptedText;

String friendId;
String uid;
String time;

class ChatScreen extends StatefulWidget {
  final friendUid;
  final friendName;

  ChatScreen({this.friendUid, this.friendName});

  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String messageText;

  @override
  void initState() {
    super.initState();
    friendId = widget.friendUid;
    getCurrentUser();
    //print(loggedInUser);
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        setState(() {
          loggedInUser = user;
          //userId = loggedInUser.uid;
          uid = loggedInUser.uid;
        });
      }
      print(loggedInUser);
    } catch (e) {
      print(e);
    }
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
                print(widget.friendUid);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
              }),
        ],
        title: Text(widget.friendName),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //MessagesStream(),
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      setState(() {
                        encrypted = encrypter.encrypt(messageText, iv: iv);
                        encryptedText = encrypted.base64;
                      });

                      DateTime _now = DateTime.now();
                      _firestore
                          .collection('${uid}/${widget.friendUid}/messages')
                          .add({
                        'text': encryptedText,
                        //'text': messageText,
                        'sender': loggedInUser.email,
                        'time': '${_now.hour}:${_now.minute}'
                      });

                      _firestore
                          .collection('${widget.friendUid}/${uid}/messages')
                          .add({
                        'text': encryptedText,
                        //'text': messageText,
                        'sender': loggedInUser.email,
                        'time': '${_now.hour}:${_now.minute}'
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        // ignore: missing_return, missing_return
        stream: _firestore.collection('${uid}/$friendId/messages').snapshots(),
        // ignore: missing_return, missing_return
        builder: (context, snapshot) {
          // ignore: missing_return, missing_return
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final messages = snapshot.data.documents.reversed; //.reversed
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            final text = message.data['text'];
            //final messageText = message.data['text'];
            final messageSender = message.data['sender'];
            final time = message.data['time'];

            final currentUser = loggedInUser.email;

            var source = '$text';
            decrypted = encrypter.decrypt64(source, iv: iv);
            print(decrypted);

            final messageBubble = MessageBubble(
              sender: messageSender,
              text: decrypted,
              //text: messageText,
              time: time,
              isMe: currentUser == messageSender,
            );
            messageBubbles.add(messageBubble);
          }

          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageBubbles,
            ),
          );
        });
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.time, this.isMe});

  final String sender;
  final String text;
  final String time;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 15.0,
                  color: isMe ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
