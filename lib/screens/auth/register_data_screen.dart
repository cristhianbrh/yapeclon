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
                        SizedBox(height: 5),
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
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Color(0xFFFFFFFF)),

                child: Column(
                  spacing: 20,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        spacing: -5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tipo de Documento",
                            style: TextStyle(
                              color: Color.fromARGB(62, 34, 34, 17),

                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              letterSpacing: .1,
                            ),
                          ),
                          DropdownButton<String>(
                            isExpanded: true,
                            items:
                                <String>["DNI"].map((String value) {
                                  return DropdownMenuItem<String>(
                                    child: Text(value),
                                    value: value,
                                  );
                                }).toList(),
                            onChanged: (newValue) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        spacing: -5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Número de documento",
                            style: TextStyle(
                              color: Color.fromARGB(62, 34, 34, 17),

                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              letterSpacing: .1,
                            ),
                          ),
                          DropdownButton<String>(
                            isExpanded: true,
                            items:
                                <String>["DNI"].map((String value) {
                                  return DropdownMenuItem<String>(
                                    child: Text(value),
                                    value: value,
                                  );
                                }).toList(),
                            onChanged: (newValue) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
