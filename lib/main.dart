import 'package:flutter/material.dart';
import 'package:yapeclon/screens/auth/create_account_screen.dart';
import 'package:yapeclon/screens/auth/create_password_screen.dart';
import 'package:yapeclon/screens/auth/login_screen.dart';
import 'package:yapeclon/screens/auth/register_data_screen.dart';
import 'package:yapeclon/screens/home/home_screen.dart';
import 'package:yapeclon/screens/home/house_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YAPECLON',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/crear-cuenta': (context) => CreateAccountScreen(),
        '/crear-clave': (context) => CreatePasswordScreen(),
        '/registrar-datos': (context) => RegisterDataScreen(),
        '/home': (context) => HomeScreen(),
        '/house': (context) => HouseScreen(),
      },
    );
  }
}
