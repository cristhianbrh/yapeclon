import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LayoutMain extends StatelessWidget {
  final Widget child;
  final String? title;

  const LayoutMain({super.key, required this.child, this.title});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      // appBar: AppBar(title: Text('Inicio')),
      backgroundColor: Color.fromARGB(255, 115, 9, 144),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 115, 9, 144),
                Color.fromARGB(255, 116, 34, 132),
              ],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
