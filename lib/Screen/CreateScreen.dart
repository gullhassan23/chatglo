import 'package:chatglo/Methods/Methods.dart';
import 'package:chatglo/Screen/LoginScreen.dart';
import 'package:chatglo/global.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
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
              ),
            )
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
                      "Create Account to Continue!",
                      style: TextStyle(
                          fontSize: 20,
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
  TextEditingController Name = new TextEditingController();

  String email = "";
  String name = "";
  String Pass = "";
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
              controller: Name,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your Name";
                } else
                  return null;
              },
              onSaved: (value) {
                setState(() {
                  name = value.toString();
                });
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                labelText: "Name",
                hintText: "Enter a name",
              ),
            ),
          ),
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
                  email = value.toString();
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
                  Pass = value.toString();
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
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: 'Confirm Password',
                    labelText: 'Enter Confirm Password'),
                validator: (confirmPassword) {
                  if (confirmPassword != null && confirmPassword.isEmpty) {
                    return 'Enter confirm password';
                  }
                  var password = pass.currentState?.value;
                  if (confirmPassword != null &&
                      confirmPassword.compareTo(password) != 0) {
                    return 'Password mismatch';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    password = value.toString();
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  if (formV.currentState!.validate()) {
                    formV.currentState?.save();
                    setState(() {
                      isloading = true;
                    });

                    createAccount(name, email, password).then((user) {
                      if (user != null) {
                        setState(() {
                          isloading = false;
                        });

                        print("Account created successfully");
                      } else {
                        print("login failed");
                      }
                    });
                  } else {
                    print("please enter fields");
                  }

                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "Create an Account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    // if (email.isNotEmpty && password.isNotEmpty) {
                    //   setState(() {
                    //     isloading = true;
                    //   });

                    //   LogIn(email, password).then((user) {
                    //     if (user != null) {
                    //       print("login sucessfull");

                    //       setState(() {
                    //         isloading = false;
                    //       });
                    //     } else {
                    //       print("login failed");
                    //     }
                    //   });
                    // } else {
                    //   print("please fill form correctly");
                    // }

                 
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    
                  },
                  child: Text("Login")),
            ),
          ),
        ],
      ),
    );
  }
}
