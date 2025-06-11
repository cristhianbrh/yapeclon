import 'package:flutter/material.dart';

class CardViewDetailsWidget extends StatefulWidget {
  final double saldo;

  const CardViewDetailsWidget({super.key, required this.saldo});

  @override
  State<CardViewDetailsWidget> createState() => _CardViewDetailsWidgetState();
}

class _CardViewDetailsWidgetState extends State<CardViewDetailsWidget> {
  bool _viewSaldo = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _viewSaldo = !_viewSaldo;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(62, 255, 255, 255),
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide.none,
        ),
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(0, 0),
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
          children: [
            Icon(Icons.remove_red_eye, color: Colors.purple),
            SizedBox(width: 8),
            Text(
              "Mostrar saldo",
              style: TextStyle(
                color: const Color.fromARGB(255, 120, 30, 136),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(child: Container()),
            if (_viewSaldo)
              Text(
                "S/ ${widget.saldo.toString()}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
