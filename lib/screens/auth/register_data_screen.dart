import 'package:flutter/material.dart';

class RegisterDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Inicio')),
      backgroundColor: Color(0xFF720e9e),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // height: 100,
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text(
                    "Crear Cuenta",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Registrar datos",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Completa el formulario, Recuerda que todos los datos son obligatorios",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
                child: Column(children: [Text("Crear Cuenta")]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
