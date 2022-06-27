import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:loginpractica/screens/home.dart';
import 'dart:io';
import 'package:path/path.dart';

class Agregar extends StatefulWidget {
  const Agregar({Key? key}) : super(key: key);

  @override
  State<Agregar> createState() => _AgregarState();
}

class _AgregarState extends State<Agregar> {
  File? sampleImage;
  final key = GlobalKey<FormState>();
  String  descripcion = "";
  String  precio = "";
  String  nombre = "";
  String  tamanio = "";
  var url ="";
  @override
  Widget build(BuildContext context) {
    void volver(){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar imagen"),
      ),
      body: Center(
          child: sampleImage == null ? Text("subir imagen") : enableUpload()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImage();
        },
        tooltip: 'Subir foto',
        child: Icon(Icons.add_a_photo_outlined),
      ),
    );
  }

  Future getImage() async {
    final sampleImage = await ImagePicker().pickImage(source: ImageSource.gallery);


    final temp1 = sampleImage!.path;
    print(temp1);
    setState(() {
      this.sampleImage = File(temp1);
    });
  }

  Widget enableUpload() {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: key,
          child: Column(
            children: [
              Image.file(
                sampleImage!,
                height: 300,
                width: 600,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(

                  decoration: InputDecoration(labelText: "Descripcion"),
                  validator: (value) {
                    return value!.isEmpty ? "Una descripcion es requerida" : null;
                  },
                  onSaved: (value){
                    descripcion = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(

                  decoration: InputDecoration(labelText: "Precio"),
                  validator: (value) {
                    return value!.isEmpty ? "Un precio es requerid0" : null;
                  },
                  onSaved: (value){
                    precio = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(

                  decoration: InputDecoration(labelText: "Nombre"),
                  validator: (value) {
                    return value!.isEmpty ? "Un nombre es requerido" : null;
                  },
                  onSaved: (value){
                    nombre = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(

                  decoration: InputDecoration(labelText: "Tamaño"),
                  validator: (value) {
                    return value!.isEmpty ? "Un tamaño es requerid0" : null;
                  },
                  onSaved: (value){
                    tamanio = value!;
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.greenAccent
                ),
                child: FlatButton(
                    onPressed: () {upload();}, child: Text("Subir nueva publicacion")),
              )
            ],
          ),
        ),
      ),
    );
  }
  void subiraDatabase() async{
    DatabaseReference ref =  FirebaseDatabase.instance.reference();
    var data = {
      "imagen":url,
      "descripcion":descripcion,
      "precio":precio,
      "nombre":nombre,
      "tamanio":tamanio
    };
    ref.child("pulseras").push().set(data);
    Navigator.of(this.context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));

  }
  void upload() async{
    //Firebase.initializeApp();
    if (validateForm()){
      final  String nombre = basename(this.sampleImage!.path);

      final destination = "pulseras/${nombre}";

      final  referencia =  await  FirebaseStorage.instance.ref(destination);
      //referencia.putFile(this.sampleImage!);
      UploadTask task =   referencia.putFile(this.sampleImage!);
      final snap =   await task.whenComplete(() {} );
      final  urldownload = await snap.ref.getDownloadURL();
      this.url = urldownload;
      print(url);
      subiraDatabase();

    }
  }
  bool validateForm(){
    final form = key.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }
}
