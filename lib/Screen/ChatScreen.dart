// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ChatScreen extends StatelessWidget {
//   Map<String, dynamic>? userMap;
//   final String chatRoomID;
//   ChatScreen({
//     Key? key,
//     this.userMap,
//     required this.chatRoomID,
//   }) : super(key: key);

//   TextEditingController _message = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final Size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Name"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: Size.height / 1.25,
//               width: Size.width,
//               child: StreamBuilder<QuerySnapshot>,
//             ),
//             Container(
//               height: Size.height / 10,
//               width: Size.width,
//               alignment: Alignment.center,
//               child: Container(
//                 height: Size.height / 12,
//                 width: Size.width/1.1,
//                 child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [],),
//               ),
//             )
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: Size.height / 10,
//         width: Size.width,
//         alignment: Alignment.center,
//         child: Container(
//           height: Size.height / 12,
//           width: Size.width / 1.1,
//           child: Row(
//             children: [
//               Container(
//                 height: Size.height / 12,
//                 width: Size.width / 1.5,
//                 child: TextField(
//                   controller: _message,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8))),
//                 ),
//               ),
//               IconButton(onPressed: () {}, icon: Icon(Icons.send))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
