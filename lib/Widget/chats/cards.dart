import 'package:flutter/material.dart';

import 'package:chatglo/Model/chatModel.dart';
import 'package:chatglo/Screen/IndividualScreen.dart';

class Cardss extends StatelessWidget {
  final ChatModel chatModel;
  final ChatModel sourchat;
  const Cardss({
    Key? key,
    required this.chatModel,
    required this.sourchat,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualScreen(key, chatModel,sourchat)));
      },
      child: Column(
        children: [
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  chatModel.isGroup
                      ? "assets/images/group.png"
                      : "assets/images/1.PNG",
                  height: 70,
                  width: 50,
                ),
              ),
            ),
            title: Text(chatModel.name),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(chatModel.currentMessage),
              ],
            ),
            trailing: Text(chatModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 60),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
