// import 'package:chatglo/Methods/Methods.dart';
// import 'package:chatglo/Screen/ChatScreen.dart';
// import 'package:chatglo/global.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic>? userMap;
//     final Size = MediaQuery.of(context).size;
//     TextEditingController _search = new TextEditingController();

//     void onSearch() async {
//       final db = FirebaseDatabase.instance.ref("Users");
//       // FirebaseFirestore _firebase = FirebaseFirestore.instance;
//       setState(() {
//         isloading = true;
//       });

//       await db.child("fields").equalTo(_search).get().then((value) {
//         setState(() {});
//       });
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("home button"),
//         actions: [
//           ElevatedButton.icon(
//               onPressed: () => logout(context),
//               icon: Icon(Icons.logout_sharp),
//               label: Text("Logout"))
//         ],
//       ),
//       body: isloading
//           ? Center(
//               child: Container(
//                 height: Size.height / 20,
//                 width: Size.height / 20,
//                 child: CircularProgressIndicator(),
//               ),
//             )
//           : Column(
//               children: [
//                 SizedBox(
//                   height: Size.height / 20,
//                 ),
//                 Container(
//                   height: Size.height / 14,
//                   width: Size.width,
//                   alignment: Alignment.center,
//                   child: Container(
//                     height: Size.height / 14,
//                     width: Size.height / 2,
//                     child: TextField(
//                       controller: _search,
//                       decoration: InputDecoration(
//                           hintText: "Search",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: Size.height / 50,
//                 ),
//                 ElevatedButton(onPressed: onSearch, child: Text("Search")),
//                 SizedBox(
//                   height: Size.height / 30,
//                 ),
//                 userMap != null
//                     ? ListTile(
//                         onTap: () => Navigator.of(context).push(
//                             MaterialPageRoute(builder: (_) =>ChatScreen())),
//                         leading: Icon(
//                           Icons.account_box,
//                           color: Colors.black,
//                         ),
//                         title: Text(
//                           userMap["name"],
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 17,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         subtitle: Text(userMap['email']),
//                         trailing: Icon(
//                           Icons.chat,
//                           color: Colors.black,
//                         ),
//                       )
//                     : Container()
//               ],
//             ),
//     );
//   }
// }
