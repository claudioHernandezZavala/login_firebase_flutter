import 'package:flutter/material.dart';
class panelAdmin extends StatefulWidget {
  const panelAdmin({Key? key}) : super(key: key);

  @override
  _panelAdminState createState() => _panelAdminState();
}

class _panelAdminState extends State<panelAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panel"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(

          children: [
            SizedBox(height: 70,),
            Container(
              child: Text("Numero de compras:"),
            ),
            SizedBox(height: 70,),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue
                ),
                child: FlatButton(
                  onPressed: (){},
                  child: Text("Mis pedidos"),
                )
            ),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue
              ),
             child: FlatButton(
               onPressed: (){},
               child: Text("Ver lista de productos"),

             ),
            ),
          ],
        ),
      ),
    );
  }
}
