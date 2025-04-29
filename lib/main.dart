import 'package:flutter/material.dart';
import 'package:yapeclon/screens/auth/create_account_screen.dart';
import 'package:yapeclon/screens/auth/create_password_screen.dart';
import 'package:yapeclon/screens/auth/login_screen.dart';
import 'package:yapeclon/screens/auth/register_data_screen.dart';
import 'package:yapeclon/screens/home/history_screen.dart';
import 'package:yapeclon/screens/home/home_screen.dart';
import 'package:yapeclon/screens/home/house_screen.dart';
import 'package:yapeclon/screens/home/listcontact_screen.dart';
import 'package:yapeclon/screens/home/options_creen.dart';
import 'package:yapeclon/screens/home/scanner_screen.dart';
import 'package:yapeclon/screens/home/yapear_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YAPECLON',
      initialRoute: '/listcontact',
      routes: {
        '/login': (context) => LoginScreen(),
        '/crear-cuenta': (context) => CreateAccountScreen(),
        '/crear-clave': (context) => CreatePasswordScreen(),
        '/registrar-datos': (context) => RegisterDataScreen(),
        '/home': (context) => HomeScreen(),
        '/house': (context) => HouseScreen(),
        '/listcontact': (context) => ListcontactScreen(),
        '/history': (context) => HistoryScreen(),
        '/scanner': (context) => ScannerScreen(),
        '/yapear': (context) => YapearScreen(),
        '/option': (context) => OptionsCreen(),
      },
    );
  }
}
