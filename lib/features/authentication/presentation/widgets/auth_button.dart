// ignore_for_file: prefer_const_constructors

import 'package:clean_architecture_tdd/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;
  const AuthButton({super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: const [
          AppPallete.gradient1,
          AppPallete.gradient2
        ] ),
        borderRadius: BorderRadius.circular(5)
      ),
      child: ElevatedButton(onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppPallete.transparentColor,
            fixedSize: Size(395, 55),
            shadowColor: AppPallete.transparentColor
          ), 
          child: Text(
            textButton,style: TextStyle(
              color: AppPallete.whiteColor,
              fontSize: 21,
              fontWeight: FontWeight.w700
            ),
          ),
      ),
    );
  }
}