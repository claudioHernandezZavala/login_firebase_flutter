import 'package:flutter/material.dart';
import 'package:loginpractica/modelos/productos.dart';

import '../../constants.dart';
class Producto_conImagen_Precio extends StatelessWidget {
  const Producto_conImagen_Precio({
    Key? key,
    required this.producto,
  }) : super(key: key);

  final Producto producto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kdefaultpadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("PLATA",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text(
            producto.titulo,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 20,),
              RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "Precio:\n"),
                    TextSpan(
                        text: "Lps ${producto.precio}",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white)
                    )
                  ])),

              SizedBox(
                width: kdefaultpadding,
              ),
              Expanded(child: Image.network(producto.imagen,fit: BoxFit.fill,))
            ],
          )
        ],
      ),
    );
  }
}
