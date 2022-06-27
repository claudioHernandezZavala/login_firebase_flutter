import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpractica/Widgets/EmalText-FieldInput.dart';
import 'package:loginpractica/Widgets/Password-InputField.dart';
import 'package:loginpractica/constants.dart';
import 'package:loginpractica/screens/login.dart';

class register extends StatelessWidget {

  const register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailcontroller =  TextEditingController();
    final passwordController =  TextEditingController();
    return Stack(
      children: [
        function(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Center(
                        child: Text(
                      "Registro",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                    height: 150,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            textField(
                                hint: "Email",
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.emailAddress,
                                icon: Icons.email,controller: emailcontroller,),
                            textField(
                                hint: "Direccion",
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.streetAddress,
                                icon: Icons.directions,controller: emailcontroller,),
                            textField(
                                hint: "Nombre de usuario",
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.name,
                                icon: Icons.supervised_user_circle,controller: emailcontroller,),
                            PasswordField(
                                hint: "Contraseña",
                                textInputAction: TextInputAction.next,
                                icon: Icons.lock,controller: passwordController,),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: FlatButton(
                                    onPressed: () async{
                                     // FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text, password:passwordController.text);
                                      GoogleAuthProvider.GOOGLE_SIGN_IN_METHOD;
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12),
                                      child: Text("Registrarme"),
                                    )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
