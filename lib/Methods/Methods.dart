import 'package:chatglo/Screen/LoginForm.dart';
import 'package:chatglo/Screen/LoginScreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import "package:firebase_database/firebase_database.dart";

import 'package:flutter/material.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseDatabase.instance.ref("Users");
  // FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print("Account created Successfully");

      //  await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      //     "name": name,
      //     "email": email,
      //     "status": "Unavalible",
      //     "uid": _auth.currentUser!.uid,
      //   });
      await db.child('fields').set({
        "name": name,
        "email": email,
        "ID": DateTime.now().millisecondsSinceEpoch.toString(),
      });
      return user;
    } else {
      print("Account Creation failed");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> LogIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print("Login Successfully");
      return user;
    } else {
      print("Login Failed");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future logout(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => LoginForm())));
    });
  } catch (e) {
    print("error");
  }
}
