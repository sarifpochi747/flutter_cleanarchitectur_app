// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String placeHolder;
  final bool obscureText;
  final TextEditingController controller;
  const AuthField({super.key, required this.placeHolder, this.obscureText = false, required this.controller });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeHolder.toString(),
        hintStyle: TextStyle(color: Colors.white,fontSize: 15),
      ),
      obscureText:obscureText ,  
      // autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        if(value == null || value.isEmpty) {
          return "$placeHolder is missing";
        }
        return null;
      },      
    );
  }
}