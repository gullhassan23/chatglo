// import 'package:chatglo/Screen/HomeRoom.dart';
import 'package:chatglo/Screen/LoginForm.dart';
import 'package:chatglo/Screen/LoginScreen.dart';
import 'package:chatglo/Screen/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return SplashScreen();
    } else {
      return LoginForm();
    }
  }
}
