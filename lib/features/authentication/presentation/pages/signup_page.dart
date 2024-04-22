// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clean_architecture_tdd/core/utils/show_snackbar.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/pages/signin_page.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/widgets/auth_button.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/widgets/auth_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthFailure){
            return showSnackBar(context,state.message);
          }
        },
        builder: (context, state) {
         
          return Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _textFeildTitle(),
                SizedBox(
                  height: 30,
                ),
                AuthField(
                  placeHolder: "Name",
                  controller: nameController,
                ),
                SizedBox(
                  height: 15,
                ),
                AuthField(
                  placeHolder: "Email",
                  controller: emailController,
                ),
                SizedBox(
                  height: 15,
                ),
                AuthField(
                  placeHolder: "Password",
                  obscureText: true,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 30,
                ),
                AuthButton(
                  textButton: "Sign Up",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(AuthSignUp(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()));
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                _richText()
              ],
            ),
          );
        },
      ),
    ));
  }

  Widget _textFeildTitle() {
    return Text(
      "Sign up.",
      style: TextStyle(
          color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
    );
  }

  Widget _richText() {
    return RichText(
      text: TextSpan(
          text: "Already have an account? ",
          style: Theme.of(context).textTheme.titleMedium,
          children: [
            TextSpan(
                text: "Sign In",
                style: TextStyle(color: Colors.red[300]),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // direct to sign in page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                  })
          ]),
    );
  }
}
