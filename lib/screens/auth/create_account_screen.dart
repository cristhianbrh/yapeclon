import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ooui.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Inicio')),
      backgroundColor: Color(0xFF720e9e),
      body: SafeArea(
        child: Column(
          children: [
            _topHeaderCreateAccount(context),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Color(0xFFFFFFFF)),

                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20,
                    children: [
                      _buildTextField(
                        "Número de celular",
                        TextInputType.phone,
                        "999 999 999",
                      ),
                      SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          children: [
                            TextSpan(
                              text: "Al pulsar Continuar estoy aceptando los ",
                            ),
                            TextSpan(
                              text: "Términos y condiciones ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                              // Puedes agregar un recognizer para hacer clic
                            ),
                            TextSpan(text: "de Yape."),
                          ],
                        ),
                      ),
                      SizedBox(height: 150),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/registrar-datos");
                        },
                        child: Text(
                          "Continuar",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 34, 211, 191),
                          minimumSize: Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDropdownField() {
  return Column(
    spacing: 1,
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
              return DropdownMenuItem<String>(child: Text(value), value: value);
            }).toList(),
        onChanged: (newValue) {},
      ),
    ],
  );
}

Widget _buildTextField(String label, TextInputType inputType, [String? hint]) {
  return Column(
    spacing: 0,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          color: Color.fromARGB(62, 34, 34, 17),

          fontWeight: FontWeight.w600,
          fontSize: 12,
          letterSpacing: .1,
        ),
      ),
      TextField(
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Color.fromARGB(62, 34, 34, 17),
            fontSize: 12,
          ),
        ),
      ),
    ],
  );
}

Widget _topHeaderCreateAccount(BuildContext context) {
  return Container(
    // height: 100,
    padding: EdgeInsets.only(top: 10),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: Iconify(
                  Ooui.previous_ltr,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Crear Cuenta",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Registro de celular",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Te enviaremos un código de verificación por sms para validar tu número",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
