import 'package:flutter/material.dart';

/// Widget reutilizable para campos de texto con etiqueta y hint.
class InputMainWidget extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final TextEditingController controller;
  final String? hint;

  const InputMainWidget({
    Key? key,
    required this.label,
    required this.inputType,
    required this.controller,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
}
