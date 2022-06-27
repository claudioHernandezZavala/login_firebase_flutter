

import 'package:flutter/material.dart';
import 'package:loginpractica/components/body.dart';
import 'package:loginpractica/constants.dart';

import '../Widgets/navBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: navBar(),

      appBar: appbarInicio(),
      body: body(),
    );
  }
}

AppBar appbarInicio() {
  return AppBar(

    title: Text("Shop", style: TextStyle(color: Colors.black),),


    actions: <Widget>[
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search),
        color: kTextColor,
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.shopping_cart),
        color: kTextColor,
      ),
      SizedBox(
        width: kdefaultpadding / 2,
      )
    ],
    backgroundColor: Colors.blue,
    centerTitle: true,
  );
}
