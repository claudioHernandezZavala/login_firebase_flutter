import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loginpractica/constants.dart';
import 'package:loginpractica/modelos/productos.dart';
import 'package:loginpractica/screens/details/details.dart';

import 'categorias.dart';
import 'gridPulseras.dart';

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  List<Producto> productos = [];
  void initState() {
    DatabaseReference postref =
        FirebaseDatabase.instance.reference().child('pulseras');
    postref.once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      productos.clear();

      for (var keyindividual in keys) {
        Producto ProductoNuevo = Producto(
            data[keyindividual]['imagen'],
            data[keyindividual]['nombre'],
            data[keyindividual]['descripcion'],
            data[keyindividual]['precio'],
            data[keyindividual]['tamanio'],
            Colors.blue);
        productos.add(ProductoNuevo);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        setState(() {initState();});
        return FirebaseDatabase.instance.goOnline();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          categorias(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kdefaultpadding),
            child: StreamBuilder<Object>(
                stream: FirebaseDatabase.instance.reference().child('pulseras').onChildAdded,
                builder: (context, snapshot) {
                  return GridView.builder(
                      itemCount: productos.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,

                          mainAxisSpacing: kdefaultpadding,
                          crossAxisSpacing: kdefaultpadding,
                          childAspectRatio: 0.75),
                          itemBuilder: (context, index) =>
                          ItemCard2(producto: productos[index]));
                }),
          ))
        ],
      ),
    );
  }
}
