import 'package:flutter/material.dart';
import 'package:loginpractica/constants.dart';
import 'package:loginpractica/modelos/productos.dart';
import 'package:loginpractica/screens/details/body.dart';
class detailScreen extends StatelessWidget {
  final Producto producto;
  const detailScreen({Key? key, required this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: producto.color,
      appBar:buildAppbar(context),
      body: bodyDetails(producto:producto),

    );
  }
  AppBar buildAppbar(BuildContext context){
    return AppBar(
      elevation: 0,
      backgroundColor: producto.color,
      leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: ()=> Navigator.pop(context),),
      actions: [
        IconButton(onPressed: (){}, icon:Icon(Icons.search)),
        IconButton(onPressed: (){}, icon:Icon(Icons.shopping_cart)),

        SizedBox(width: kdefaultpadding/2,)
      ],
    );
  }

}
