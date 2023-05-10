import 'package:chatglo/Model/chatModel.dart';
import 'package:chatglo/Widget/Avarar.dart';
import 'package:chatglo/Widget/ContactCard.dart';
import 'package:chatglo/Widget/theme.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(
        select: true,
        status: "Available",
        id: 1,
        name: "Hassan",
        icon: Icon(Icons.done_all),
        isGroup: false,
        time: "4:00",
        currentMessage: "Hello how are you"),
    ChatModel(
        select: true,
        status: "Available",
        name: "Ali",
        icon: Icon(Icons.done),
        id: 2,
        isGroup: true,
        time: "2:00",
        currentMessage: "Hi This is Ali"),
    ChatModel(
        select: true,
        status: "Available",
        id: 3,
        name: "Usman",
        icon: Icon(Icons.done),
        isGroup: false,
        time: "3:00",
        currentMessage: "Hi This is Usman"),
    ChatModel(
        select: true,
        status: "Available",
        name: "yusaf",
        id: 4,
        icon: Icon(Icons.done),
        isGroup: false,
        time: "3:00",
        currentMessage: "Hi This is Usman")
  ];
  List<ChatModel> groupmember = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mytheme.whatsappTheme,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New Group",
                style: TextStyle(
                  fontSize: 22,
                )),
            Text(
              "Add participant",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groupmember.length > 0 ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (contacts[index].select == false) {
                      setState(() {
                        contacts[index].select = true;
                        groupmember.add(contacts[index]);
                      });
                    } else {
                      setState(() {
                        contacts[index].select = false;
                        groupmember.remove(contacts[index]);
                      });
                    }
                  },
                  child: ContactCard(
                    contact: contacts[index],
                  ),
                );
              }),
          groupmember.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            if (contacts[index].select == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    groupmember.remove(contacts[index]);
                                    contacts[index].select = false;
                                  });
                                },
                                child: Avatar(
                                  contact: contacts[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    Divider(
                      thickness: 1,
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
