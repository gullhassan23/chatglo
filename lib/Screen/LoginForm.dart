import 'package:chatglo/Screen/HomeRoom.dart';
import 'package:chatglo/Widget/ButtonCard.dart';
import 'package:flutter/material.dart';

import '../Model/chatModel.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late ChatModel sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
        select: true,
        status: "Available",
        name: "Hassan",
        id: 1,
        icon: Icon(Icons.done_all),
        isGroup: false,
        time: "4:00",
        currentMessage: "Hello how are you"),
    // ChatModel(
    //   select: true,
    //    status: "Available",
    // id=2,
    //     name: "Ali",
    //     icon: Icon(Icons.done),
    //     isGroup: true,
    //     time: "2:00",
    //     currentMessage: "Hi This is Ali"),
    ChatModel(
        select: true,
        status: "Available",
        name: "Usman",
        id: 3,
        icon: Icon(Icons.done),
        isGroup: false,
        time: "3:00",
        currentMessage: "Hi This is Usman"),
    ChatModel(
        select: true,
        status: "Available",
        name: "abubaker",
        id: 4,
        icon: Icon(Icons.done),
        isGroup: false,
        time: "3:00",
        currentMessage: "Hi This is Abubaker")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodels.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  sourceChat = chatmodels.removeAt(index);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (builder) => HomeScreen(chatmodels: chatmodels,sourchat: sourceChat,)));
                },
                child: ButtonCard(
                  name: chatmodels[index].name,
                  icon: Icons.person,
                ),
              )),
    );
  }
}
