import 'package:flutter/material.dart';



class ButtonCard extends StatelessWidget {
  const ButtonCard({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange,
          radius: 24,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
