import 'package:camera/camera.dart';
import 'package:chatglo/Methods/Authenticate.dart';

// import 'package:chatglo/Screen/HomeRoom.dart';
import 'package:chatglo/Widget/Camera/CameraScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authentication(),
      // home: LandingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
