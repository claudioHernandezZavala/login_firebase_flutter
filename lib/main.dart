import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpractica/screens/home.dart';
import 'package:loginpractica/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:iniciar()
    );
  }
  Widget iniciar(){

    if(FirebaseAuth.instance.currentUser==null){
      return login();
    }else{
      return HomeScreen();
    }
  }



  }



