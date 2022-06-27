import 'package:flutter/material.dart';
import 'package:loginpractica/constants.dart';
import 'package:loginpractica/modelos/productos.dart';
import 'package:loginpractica/screens/details/productoImagenYPrecio.dart';

class bodyDetails extends StatelessWidget {
  final Producto producto;
  const bodyDetails({Key? key, required this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                ),
                Producto_conImagen_Precio(producto: producto)
              ],
            ),
          )
        ],
      ),
    );
  }
}

