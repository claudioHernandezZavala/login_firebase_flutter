

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpractica/components/body.dart';
import 'package:loginpractica/Widgets/navBar.dart';


class inicio extends StatelessWidget {

  const inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: navBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: Text("Shop"),
      ),
      body: body(),

    );
  }
}
