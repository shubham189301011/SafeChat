import 'package:chatapp/Models/chatMessageModel.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

//final _firestore = Firestore.instance;
//FirebaseUser loggedInUser;

class _ChatDetailPageState extends State<ChatDetailPage> {
  // List<ChatMessage> messages = [
  //   ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  //   ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Hey Kriss, I am doing fine dude. wbu?",
  //       messageType: "sender"),
  //   ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Is there any thing wrong?", messageType: "sender"),
  // ];

  @override
  void initState() {
    super.initState();
  }

  String messageText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                    // backgroundImage: NetworkImage(
                    //     "<https://randomuser.me/api/portraits/men/5.jpg>"),
                    // maxRadius: 20,
                    ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Kriss Benwat",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          //MessagesStream(),
          // ListView.builder(
          //   itemCount: messages.length,
          //   shrinkWrap: true,
          //   padding: EdgeInsets.only(top: 10, bottom: 10),
          //   physics: NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, index) {
          //     return Container(
          //       padding:
          //           EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
          //       child: Align(
          //         alignment: (messages[index].messageType == "receiver"
          //             ? Alignment.topLeft
          //             : Alignment.topRight),
          //         child: Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20),
          //             color: (messages[index].messageType == "receiver"
          //                 ? Colors.grey.shade200
          //                 : Colors.blue[200]),
          //           ),
          //           padding: EdgeInsets.all(16),
          //           child: Text(
          //             messages[index].messageContent,
          //             style: TextStyle(fontSize: 15),
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  // FloatingActionButton(
                  //   onPressed: () {
                  //     _firestore.collection('messages').add({
                  //       'text': 'Hii',
                  //       'sender': 'Email',
                  //     });
                  //   },
                  //   child: Icon(
                  //     Icons.send,
                  //     color: Colors.white,
                  //     size: 18,
                  //   ),
                  //   backgroundColor: Colors.blue,
                  //   elevation: 0,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class MessagesStream extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _firestore.collection('messages').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.lightBlueAccent,
//             ),
//           );
//         }
//         final messages = snapshot.data.documents.reversed;
//         List<MessageBubble> messageBubbles = [];
//         for (var message in messages) {
//           final messageText = message.data['text'];
//           final messageSender = message.data['sender'];
//
//           // final currentUser = loggedInUser.email;
//           //
//           // var decrypted = encrypter.decrypt(encrypted, iv: iv);
//
//           final messageBubble = MessageBubble(
//             sender: messageSender,
//             //text: decrypted,
//             text: messageText,
//             //isMe: currentUser == messageSender,
//             isMe: true,
//           );
//
//           messageBubbles.add(messageBubble);
//         }
//         return Expanded(
//           child: ListView(
//             reverse: true,
//             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//             children: messageBubbles,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class MessageBubble extends StatelessWidget {
//   MessageBubble({this.sender, this.text, this.isMe});
//
//   final String sender;
//   final String text;
//   final bool isMe;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment:
//             isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             sender,
//             style: TextStyle(
//               fontSize: 12.0,
//               color: Colors.black54,
//             ),
//           ),
//           Material(
//             borderRadius: isMe
//                 ? BorderRadius.only(
//                     topLeft: Radius.circular(30.0),
//                     bottomLeft: Radius.circular(30.0),
//                     bottomRight: Radius.circular(30.0))
//                 : BorderRadius.only(
//                     bottomLeft: Radius.circular(30.0),
//                     bottomRight: Radius.circular(30.0),
//                     topRight: Radius.circular(30.0),
//                   ),
//             elevation: 5.0,
//             color: isMe ? Colors.lightBlueAccent : Colors.white,
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   color: isMe ? Colors.white : Colors.black54,
//                   fontSize: 15.0,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
