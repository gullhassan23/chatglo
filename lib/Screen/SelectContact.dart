import 'package:chatglo/Model/chatModel.dart';
import 'package:chatglo/Widget/ButtonCard.dart';
import 'package:chatglo/Widget/ContactCard.dart';
import 'package:chatglo/Widget/CreateGroup.dart';
import 'package:chatglo/Widget/theme.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
          select: false,
          status: "Available",
          id: 1,
          name: "Hassan",
          icon: Icon(Icons.done_all),
          isGroup: false,
          time: "4:00",
          currentMessage: "Hello how are you"),
      ChatModel(
          select: false,
          status: "Available",
          name: "Ali",
          id: 2,
          icon: Icon(Icons.done),
          isGroup: true,
          time: "2:00",
          currentMessage: "Hi This is Ali"),
      ChatModel(
          select: false,
          status: "Available",
          name: "Usman",
          id: 3,
          icon: Icon(Icons.done),
          isGroup: false,
          time: "3:00",
          currentMessage: "Hi This is Usman"),
    
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mytheme.whatsappTheme,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("Invite a friend"),
                value: "Invite a friend",
              ),
              PopupMenuItem(
                child: Text("Contact"),
                value: "Contact",
              ),
              PopupMenuItem(
                child: Text("Refresh"),
                value: "Refresh",
              ),
              PopupMenuItem(
                child: Text("Help"),
                value: "Help",
              ),
              PopupMenuItem(
                child: Text("Settings"),
                value: "Settings",
              )
            ];
          })
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact",
                style: TextStyle(
                  fontSize: 20,
                )),
            Text(
              "494 contacts",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateGroup()));
                },
                child: ButtonCard(
                  icon: Icons.group,
                  name: "New group",
                ),
              );
            } else if (index == 1) {
              return ButtonCard(
                icon: Icons.person_add,
                name: "New contact",
              );
            }
            return ContactCard(
              contact: contacts[index - 2],
            );
          }),
    );
  }
}
