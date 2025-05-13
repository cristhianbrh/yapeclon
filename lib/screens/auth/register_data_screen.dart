import 'package:flutter/material.dart';
import 'package:yapeclon/data/models/user_model.dart';

class RegisterDataScreen extends StatefulWidget {
  @override
  State<RegisterDataScreen> createState() => _RegisterDataScreenState();
}

class _RegisterDataScreenState extends State<RegisterDataScreen> {
  final TextEditingController _typeDocController = TextEditingController();
  final TextEditingController _documentController = TextEditingController();
  final TextEditingController _emailDocController = TextEditingController();
  String? _selectedDocumentType;

  @override
  Widget build(BuildContext context) {
    final phone = ModalRoute.of(context)!.settings.arguments.toString();

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
                        _documentController,
                      ),
                      _buildTextField(
                        "Correo electrónico",
                        TextInputType.emailAddress,
                        _emailDocController,
                        "nombre@gmail.com",
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Crear el objeto con los datos
                          UserModel userData = UserModel(
                            typeDoc:
                                _selectedDocumentType ??
                                "DNI", // Asegúrate de que el valor no sea nulo
                            document: _documentController.text,
                            email: _emailDocController.text,
                            phone: phone,
                            password: "00000",
                          );

                          // Enviar los datos al siguiente Screen
                          Navigator.pushNamed(
                            context,
                            "/crear-clave", // La ruta al siguiente Screen
                            arguments:
                                userData, // Enviar el objeto con los datos
                          );

                          Navigator.pushNamed(context, "/crear-clave");
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
          value: _selectedDocumentType,
          onChanged: (newValue) {
            setState(() {
              _selectedDocumentType = newValue!;
            });
          },
          items:
              <String>["DNI"].map((String value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
        ),
      ],
    );
  }
}

Widget _buildTextField(
  String label,
  TextInputType inputType,
  TextEditingController controller, [
  String? hint,
]) {
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
        controller: controller,
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
