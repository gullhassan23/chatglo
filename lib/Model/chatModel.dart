import 'package:flutter/cupertino.dart';

class ChatModel {
  String name;
  Icon icon;
  bool isGroup;
  String time;
  String currentMessage;
  String status;
  bool select = false;
  int id;
  ChatModel({
    required this.name,
    required this.icon,
    required this.isGroup,
    required this.time,
    required this.currentMessage,
    required this.status,
    required this.id,
    this.select = false,
  });
}
