import 'package:flutter/material.dart';

import 'package:chatglo/Model/chatModel.dart';
import 'package:chatglo/Widget/theme.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.contact,
  }) : super(key: key);
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Mytheme.accentColor,
                radius: 24,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.people,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 9,
                    child: Icon(
                      Icons.clear,
                      size: 13,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            contact.name,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
