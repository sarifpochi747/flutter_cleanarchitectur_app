import 'package:flutter/material.dart';

class BlogField extends StatelessWidget {
  final String placeHolder;
  final TextEditingController controller;
  const BlogField({super.key, required this.placeHolder, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeHolder.toString(),
        hintStyle: const TextStyle(color: Colors.white,fontSize: 15),
        // hoverColor: Colors.amber
      ),
      maxLines: null,
      // autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        if(value == null || value.isEmpty){
          return "$placeHolder is missing";
        }
        return null;
      },
    );
  }
}