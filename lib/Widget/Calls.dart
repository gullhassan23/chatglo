import 'package:flutter/material.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          callCard("Hassan", Icons.call_made, Colors.green, "July 18, 10:35"),
          callCard("Abubaker", Icons.call_missed, Colors.red, "July 8, 7:00"),
          callCard(
              "Abubaker", Icons.call_received, Colors.green, "July 2, 4:00"),
        ],
      ),
    );
  }

  Widget callCard(
      String name, IconData iconData, Color iconColor, String time) {
    return Card(
      margin: EdgeInsets.only(bottom: 0.5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 26,
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Row(
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 20,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              time,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        trailing: Icon(
          Icons.call,
          size: 26,
          color: Colors.teal,
        ),
      ),
    );
  }
}
