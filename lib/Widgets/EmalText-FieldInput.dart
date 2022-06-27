import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textField extends StatelessWidget {

  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  const textField({Key? key , required this.hint,required this.textInputAction,required this.textInputType,required this.icon, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withOpacity(0.5)),
        child: TextField(
          controller: controller,
          style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
          keyboardType: textInputType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            border:InputBorder.none,

            contentPadding: EdgeInsets.symmetric(vertical: 20),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(icon),
            ),
            hintText: hint,
            hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.999),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}
