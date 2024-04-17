// ignore_for_file: prefer_const_constructors

import 'package:clean_architecture_tdd/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:clean_architecture_tdd/core/theme/theme.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/pages/signup_page.dart';
import 'package:clean_architecture_tdd/features/blog/presentation/pages/blog_page.dart';
import 'package:clean_architecture_tdd/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDependeceis();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<AuthBloc>()
        ),
        BlocProvider( 
          create: (context) => serviceLocator<AppUserCubit>() 
        ),
        // BlocProvider(create: (context) => BlogBloc());
      ], 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Blog App",
        theme: AppTheme.darkThemeMode,
        home: BlocSelector<AppUserCubit, AppUserState, bool>(
          selector: (state) {
            // return boolean
            return state is AppUserLoggedIn;
          },
          builder: (context, isLoggedIn) {
            if (isLoggedIn) {
              //home page ui
              return SignUpPage();
            } else {
              return BlogPage();
            }
          },
        )


      )
    );
  }
}