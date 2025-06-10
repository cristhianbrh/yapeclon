import 'package:flutter/material.dart';

class LayoutMain extends StatelessWidget {
  final Widget child;
  final String? title;

  const LayoutMain({super.key, required this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Inicio')),
      backgroundColor: Color.fromARGB(255, 157, 122, 172),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 148, 102, 168), Color(0xFF720e9e)],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
