import 'package:chatglo/Methods/Methods.dart';
import 'package:chatglo/Model/chatModel.dart';
import 'package:chatglo/Screen/ChatScreen.dart';
// import 'package:chatglo/global.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatglo/Widget/Calls.dart';
import 'package:chatglo/Widget/Camera/Camera.dart';
import 'package:chatglo/Widget/chats/Chats.dart';
import 'package:chatglo/Widget/Status/Status.dart';
import 'package:chatglo/Widget/groups.dart';
import 'package:chatglo/Widget/theme.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.chatmodels,
    required this.sourchat,
  }) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourchat;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic>? userMap;
    // final Size = MediaQuery.of(context).size;
    // TextEditingController _search = new TextEditingController();

    // void onSearch() async {
    //   final db = FirebaseDatabase.instance.ref("Users");
    //   // FirebaseFirestore _firebase = FirebaseFirestore.instance;
    //   setState(() {
    //     isloading = true;
    //   });

    //   await db.child("fields").equalTo(_search).get().then((value) {
    //     setState(() {});
    //   });
    // }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Mytheme.whatsappTheme,
            title: Text("Whatsapp"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Camera()));
                  },
                  icon: Icon(Icons.camera_alt)),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              PopupMenuButton(onSelected: (value) {
                print(value);
              }, itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("New group"),
                    value: "New Group",
                  ),
                  PopupMenuItem(
                    child: Text("New Broadcast"),
                    value: "New Broadcast",
                  ),
                  PopupMenuItem(
                    child: Text("Linked devices"),
                    value: "Linked devices",
                  ),
                  PopupMenuItem(
                    child: Text("Starred message"),
                    value: "Starred message",
                  ),
                  PopupMenuItem(
                    child: Text("Settings"),
                    value: "Settings",
                  ),
                  PopupMenuItem(
                    onTap: () => logout(context),
                    child: Text("logout"),
                    value: "logout",
                  )
                ];
              })
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: "Chats",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          chats(chatmodels: widget.chatmodels, sourchat: widget.sourchat),
        ]),
      ),
    );
  }
}
