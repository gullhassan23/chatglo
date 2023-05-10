import 'package:chatglo/Methods/Methods.dart';
import 'package:chatglo/Screen/CreateScreen.dart';
// import 'package:chatglo/Screen/HomeRoom.dart';
import 'package:chatglo/Screen/SplashScreen.dart';

import 'package:chatglo/global.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: isloading
          ? Center(
              child: Container(
              height: Size.height / 20,
              width: Size.width / 20,
              child: CircularProgressIndicator(),
            ))
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Size.height / 20,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: Size.width / 1.1,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back_ios))),
                  SizedBox(
                    height: Size.height / 50,
                  ),
                  Container(
                    width: Size.width / 1.5,
                    child: Text(
                      "Welcome",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: Size.height / 100,
                  ),
                  Container(
                    width: Size.width / 1.3,
                    child: Text(
                      "Sign in to Continue!",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Nform()
                ],
              ),
            ),
    );
  }
}

class Nform extends StatefulWidget {
  const Nform({super.key});

  @override
  State<Nform> createState() => _NformState();
}

class _NformState extends State<Nform> {
  final formV = GlobalKey<FormState>();
  final pass = GlobalKey<FormFieldState>();
  TextEditingController Email = new TextEditingController();
  TextEditingController Passkey = new TextEditingController();
  String _email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formV,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: Email,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your Email";
                } else
                  return null;
              },
              onSaved: (value) {
                setState(() {
                  _email = value.toString();
                });
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                labelText: "Email",
                hintText: "name@mail.com",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              key: pass,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter your Password";
                } else if (value.length < 8) {
                  return "Password must be greater than 8";
                } else
                  return null;
              },
              onSaved: (value) {
                setState(() {
                  password = value.toString();
                });
              },
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                labelText: "Password",
                hintText: "enter your 8 digit Pass code",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    if (formV.currentState!.validate()) {
                      formV.currentState?.save();
                      setState(() {
                        isloading = true;
                      });

                      LogIn(_email, password).then((user) {
                        if (user != null) {
                          print("Login successfull");
                          setState(() {
                            isloading = false;
                          });

                          Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SplashScreen()));
                        } else {
                          print("Login Failed");
                           setState(() {
                            isloading = false;
                          });
                          
                        }
                      });
                    } else {
                      print("please fill form correctly");
                    }

                    // if (formV.currentState!.validate()) {
                    //   formV.currentState?.save();
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => HomeScreen()));
                    // }
                  },
                  child: Text("Login")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateScreen()));
                },
                child: Text("Create an Account")),
          )
        ],
      ),
    );
  }
}
