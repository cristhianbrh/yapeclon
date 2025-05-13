import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yapeclon/firebase_options.dart';
import 'package:yapeclon/screens/auth/create_account_screen.dart';
import 'package:yapeclon/screens/auth/create_password_screen.dart';
import 'package:yapeclon/screens/auth/login_email_screen.dart';
import 'package:yapeclon/screens/auth/login_screen.dart';
import 'package:yapeclon/screens/auth/register_data_screen.dart';
import 'package:yapeclon/screens/home/history_screen.dart';
import 'package:yapeclon/screens/home/home_screen.dart';
import 'package:yapeclon/screens/home/house_screen.dart';
import 'package:yapeclon/screens/home/listcontact_screen.dart';
import 'package:yapeclon/screens/home/options_creen.dart';
import 'package:yapeclon/screens/home/scanner_screen.dart';
import 'package:yapeclon/screens/home/yapear_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YAPECLON',
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginScreen(),
        '/login-email': (context) => LoginEmailScreen(),
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
