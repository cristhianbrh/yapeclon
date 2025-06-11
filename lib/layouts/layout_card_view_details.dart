import 'package:flutter/material.dart';

enum EnumtypeView { content, right }

class LayoutCardViewDetails extends StatefulWidget {
  final Widget? child;
  final Widget? rightData;
  final IconData? icon;
  final String text;
  final EnumtypeView typeView;

  const LayoutCardViewDetails({
    super.key,
    required this.text,
    required this.typeView,
    this.child,
    this.rightData,
    this.icon,
  });

  @override
  State<LayoutCardViewDetails> createState() => _LayoutCardViewDetailsState();
}

class _LayoutCardViewDetailsState extends State<LayoutCardViewDetails> {
  bool _isView = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          () => {
            setState(() {
              _isView = !_isView;
            }),
          },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(62, 255, 255, 255),
        padding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 0,
        ), // control del espacio interno
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide.none,
        ),
        elevation: 0,
        tapTargetSize:
            MaterialTapTargetSize
                .shrinkWrap, // <-- evita que se expanda más de lo necesario
        minimumSize: Size(0, 0), // <-- para permitir que el botón se achique
      ),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(61, 70, 70, 70),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Row(
          spacing: 8,
          children: [
            if (widget.icon != null) Icon(widget.icon, color: Colors.purple),
            Text(
              widget.text,
              style: TextStyle(
                color: const Color.fromARGB(255, 120, 30, 136),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(child: Container()),
            if (widget.rightData != null &&
                (_isView && widget.typeView == EnumtypeView.right))
              widget.rightData!,
          ],
        ),
      ),
    );
  }
}
