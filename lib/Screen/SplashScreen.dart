import 'dart:async';

import 'package:chatglo/Screen/HomeRoom.dart';
import 'package:flutter/material.dart';

import '../Model/chatModel.dart';


class SplashScreen extends StatefulWidget {
 
  late ChatModel sourceChat;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  get sourceChat => null;

  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      chatmodels: [], sourchat: sourceChat,
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text("Shopping Helper")),
                  ],
                ),
              )),
        ));
  }
}
