import 'package:flutter/material.dart';
import 'package:flutter_application_product/cubit/auth/auth_cubit.dart';
import 'package:flutter_application_product/cubit/main/main_cubit.dart';
import 'package:flutter_application_product/screens/cart_screen.dart';
import 'package:flutter_application_product/screens/home_screen.dart';
import 'package:flutter_application_product/screens/login_screen.dart';
import 'package:flutter_application_product/screens/main_screen.dart';
import 'package:flutter_application_product/screens/search_screen.dart';
import 'package:flutter_application_product/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> MainCubit()),
        BlocProvider(create: (context)=> AuthCubit()),
      ],
      child: 
      MaterialApp(
      debugShowCheckedModeBanner: false,
    // home: SplashScren(),
    //  home: HomeScreen(),
     // home: LoginScreen(),
     home: MainScreen(),
  // home:SearchScreen(),
    // home: CartScreen(),
      
      
       )
     
     
     );
  }
}