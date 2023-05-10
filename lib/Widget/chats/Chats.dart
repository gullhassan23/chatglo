import 'package:flutter/material.dart';

import 'package:chatglo/Model/chatModel.dart';
import 'package:chatglo/Screen/SelectContact.dart';
import 'package:chatglo/Widget/chats/cards.dart';
import 'package:chatglo/Widget/theme.dart';

class chats extends StatefulWidget {
  const chats({
    Key? key,
    required this.chatmodels,
    required this.sourchat,
  }) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourchat;

  @override
  State<chats> createState() => _chatsState();
}

class _chatsState extends State<chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Mytheme.accentColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SelectContact()));
          },
          child: Icon(Icons.message),
        ),
        body: ListView.builder(
          itemCount: widget.chatmodels.length,
          itemBuilder: (context, index) => Cardss(
            chatModel: widget.chatmodels[index],
            sourchat: widget.sourchat,
          ),
        ));
  }
}
