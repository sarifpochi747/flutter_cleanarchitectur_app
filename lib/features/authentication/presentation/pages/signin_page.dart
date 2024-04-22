// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clean_architecture_tdd/core/common/widgets/loader.dart';
import 'package:clean_architecture_tdd/core/utils/show_snackbar.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/pages/signup_page.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/widgets/auth_button.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/widgets/auth_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocConsumer<AuthBloc,AuthState >(
        listener: (context, state) {
          if(state is AuthFailure){
            return showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if(state is AuthLoading)
          {
            return const LoaderWidget();
          }
          return Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _textFeildTitle(),
                SizedBox(
                  height: 30,
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
                  textButton: "Sign In",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(AuthSignIn(
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
      "Sign In.",
      style: TextStyle(
          color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
    );
  }

  Widget _richText() {
    return RichText(
      text: TextSpan(
          text: "Don't have an account? ",
          style: Theme.of(context).textTheme.titleMedium,
          children: [
            TextSpan(
                text: "Sign Up",
                style: TextStyle(color: Colors.red[300]),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    //direct to page sign up page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  })
          ]),
    );
  }
}
