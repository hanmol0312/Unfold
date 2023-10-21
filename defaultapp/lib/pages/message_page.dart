// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//     final messageTextController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//            message ,
//             Container(
//               decoration: BoxDecoration(
//   border: Border(
//     top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//   ),
// ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextField(
//                       style: TextStyle(color: Colors.black),
//                       controller: messageTextController,
//                       onChanged: (value) {
//                         //message = value;
//                       },
//                       decoration:InputDecoration(
//   contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//   hintText: 'Type your message here...',
//   hintStyle: TextStyle(color: Colors.grey),
//   fillColor: Colors.black,
//   border: InputBorder.none,
// ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       messageTextController.clear();
                      
//                     },
//                     child: Text(
//                       'Send',
//                       style: TextStyle(
//   color: Colors.lightBlueAccent,
//   fontWeight: FontWeight.bold,
//   fontSize: 18.0,
// ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//     );
//   }
// }
// class messageStream extends StatelessWidget {
//   const messageStream({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         //stream: _firestore.collection('message').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//                 child: CircularProgressIndicator(
//               backgroundColor: Colors.lightBlueAccent,
//             ));
//           }
//          // final messages = snapshot.data!.docs.reversed;
//           List<messageBubbble> messageWidgets = [];

//           for (var message in messages) {
//             Map<String, dynamic> data = message.data();
//             var messageText = data['text'];
//             var messageSender = data['sender'];
//             final messageWidget = messageBubbble(
//               text: messageText,
//               sender: messageSender,
//               isMe: loggedInUser.email == messageSender,
//             );
//             messageWidgets.add(messageWidget);
//           }
//           return Expanded(
//             child: ListView(
//               reverse: true,
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               children: messageWidgets,
//             ),
//           );
//         });
//   }
// }

// class messageBubbble extends StatelessWidget {
//   const messageBubbble(
//       {required this.text, required this.sender, required this.isMe});
//   final String text;
//   final String sender;
//   final bool isMe;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       child: Column(
//         crossAxisAlignment:
//             isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: [
//           Text(
//             sender,
//             style: TextStyle(fontSize: 12, color: Colors.grey),
//           ),
//           Material(
//             elevation: 5,
//             color: isMe ? Colors.lightBlueAccent : Colors.white,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30)),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               child: Text(
//                 text,
//                 style: TextStyle(
//                     fontSize: 20, color: isMe ? Colors.white : Colors.black54),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
