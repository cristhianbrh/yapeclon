import 'package:flutter/material.dart';

class ButtonMainWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final Color color;
  final Color backgroundColor;
  final BorderSide borderSide;
  final double elevation;
  final double fontSize;

  const ButtonMainWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.color = const Color(0xFF0FCBB3),
    this.backgroundColor = Colors.white,
    this.borderSide = const BorderSide(color: Color(0xFF0FCBB3), width: 1),
    this.elevation = 1.0,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    final buttonChild =
        icon != null ? _layoutButtonWithIcon() : _layoutButton();

    return SizedBox(width: double.infinity, height: 48, child: buttonChild);
  }

  // TODO: modificar
  Widget _layoutButton() {
    return ElevatedButton(
      onPressed: isDisabled || isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: borderSide,
        elevation: elevation,
      ),
      child:
          isLoading
              ? CircularProgressIndicator(color: Color(0xFF0FCBB3))
              : Text(text, style: TextStyle(color: color, fontSize: fontSize)),
    );
  }

  Widget _layoutButtonWithIcon() {
    return ElevatedButton.icon(
      onPressed: isDisabled || isLoading ? null : onPressed,
      icon: Icon(icon, color: color, size: 25),
      label:
          isLoading
              ? CircularProgressIndicator(color: color)
              : Text(text, style: TextStyle(color: color, fontSize: fontSize)),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: borderSide,
        elevation: elevation,
      ),
    );
  }
}
