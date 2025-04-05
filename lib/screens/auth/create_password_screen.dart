import 'package:flutter/material.dart';

class CreatePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Inicio')),
      backgroundColor: Color(0xFF720e9e),
      body: Center(
        child: ElevatedButton(
          child: Text('Ir a Detalles'),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
      ),
    );
  }
}
