import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:helper_fire_bace/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helper_fire_bace/firebase_options.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
@override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('*************User is currently signed out!');
    } else {
      print('***********User is signed in!');
    }
  });
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Login(),
    );
  }
}
