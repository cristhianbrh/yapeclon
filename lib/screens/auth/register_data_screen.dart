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
            _topHeaderCreateAccount(),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Color(0xFFFFFFFF)),

                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20,
                    children: [
                      _buildDropdownField(),
                      _buildTextField(
                        "Número de documento",
                        TextInputType.phone,
                      ),
                      _buildTextField(
                        "Correo electrónico",
                        TextInputType.emailAddress,
                        "nombre@gmail.com",
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => {},
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

Widget _topHeaderCreateAccount() {
  return Container(
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
  );
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
