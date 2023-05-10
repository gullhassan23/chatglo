import 'package:flutter/material.dart';

import 'package:chatglo/Model/chatModel.dart';
import 'package:chatglo/Widget/theme.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key? key,
    required this.contact,
  }) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 53,
          child: Stack(
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
              contact.select
                  ? Positioned(
                      bottom: 4,
                      right: 5,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 9,
                        child: Icon(
                          Icons.check,
                          size: 18,
                          color: Colors.white,
                        ),
                      ))
                  : Container()
            ],
          ),
        ),
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          contact.status,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
