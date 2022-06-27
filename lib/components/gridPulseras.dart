import "package:flutter/material.dart";

import 'package:loginpractica/modelos/productos.dart';
import 'package:loginpractica/screens/details/details.dart';
import 'package:shimmer/shimmer.dart';
import '../constants.dart';

class ItemCard extends StatelessWidget {
  final Producto producto;

  const ItemCard({
    Key? key,
    required this.producto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => detailScreen(producto: producto))),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Shimmer.fromColors(
              highlightColor: Colors.white60,
              baseColor: Colors.grey[400]!,
              child: Container(
                child: Image.network(producto.imagen),
                padding: EdgeInsets.all(kdefaultpadding),
                height: 180,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: producto.color),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kdefaultpadding / 4),
            child: Text(
              producto.titulo,
              style: TextStyle(color: kTextColor),
            ),
          ),
          Text(
            "Lps. ${producto.precio}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
class ItemCard2 extends StatelessWidget {
  final Producto producto;

  const ItemCard2({
    Key? key,
    required this.producto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => detailScreen(producto: producto))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Image.network(producto.imagen),
              padding: EdgeInsets.all(kdefaultpadding),
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: producto.color),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kdefaultpadding / 4),
            child: Text(
              producto.titulo,
              style: TextStyle(color: kTextColor),
            ),
          ),
          Text(
            "Lps. ${producto.precio}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
