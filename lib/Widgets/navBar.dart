import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpractica/screens/admin_agregar.dart';
import 'package:loginpractica/screens/login.dart';
import 'package:loginpractica/screens/panel_admin.dart';
import 'package:loginpractica/screens/profile.dart';

class navBar extends StatelessWidget {
  const navBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    String? nombre = user!.displayName;
    String? email = user.email;
    String? url = user.photoURL;

    Widget admin(){
      if(nombre =="Claudio Andre Hernández Zavala"){
        return ListTile(
          title: Text("Subir nuevas pulseras"),
          leading: Icon(Icons.add),
          onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Agregar()));
          } ,
        );
      }else{
         return ListTile(
          title: Text(""),
          leading: Icon(Icons.add),

        );
      }

    }
    Widget adminPanel(){
      if(nombre =="Claudio Andre Hernández Zavala"){
        return ListTile(
          title: Text("Panel"),
          leading: Icon(Icons.insert_chart),
          onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>panelAdmin()));
          } ,
        );
      }else{
        return ListTile(
          title: Text("jajjajaj"),
          leading: Icon(Icons.add),

        );
      }

    }
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(nombre!),
            accountEmail: Text(email!),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(url!),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage("assets/background.jpg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle_rounded),
            title: Text("Perfil"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>profile()));

            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Mis favoritos"),
            onTap: () {
              print("fav");
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Comparte nuesta app"),
            onTap: () {
              print("fav");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("Terminos y condiciones"),
            onTap: () {
              print("fav");
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Ayuda"),
            onTap: () {
              print("fav");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Configuracion"),
            onTap: () {
              print("fav");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Cerrar sesion"),
            onTap: ()  async{
              //googlesign.signOut();
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
            },
          ),
          admin(),
          adminPanel()

        ],
      ),
    );

  }

}
