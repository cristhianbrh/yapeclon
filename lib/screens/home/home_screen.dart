import 'package:flutter/material.dart';
import 'package:yapeclon/layouts/layout_main.dart';
import 'package:yapeclon/widgets/buttons/button_main_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutMain(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/icons/yapito_sorprendido.png",
                            ),
                            // fit: BoxFit.contain,
                          ),
                          Text(
                            "Envía y rercibe dinero",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Transfiere gratis a tus contactos yaperos desde tu celular",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildIndicatorPasswordLength(),
                  SizedBox(height: 60),
                ],
              ),
            ),
            Row(
              spacing: 15,
              children: [
                Expanded(
                  child: ButtonMainWidget(
                    text: "Ingresar",
                    onPressed:
                        () => {Navigator.pushNamed(context, "/login-email")},
                    borderSide: BorderSide.none,
                    backgroundColor: Colors.white30,
                    color: Colors.white,
                    elevation: 0,
                  ),
                ),
                Expanded(
                  child: ButtonMainWidget(
                    text: "Crear cuenta",
                    onPressed:
                        () => {Navigator.pushNamed(context, "/crear-cuenta")},
                    borderSide: BorderSide.none,
                    backgroundColor: Color(0xFF0FCBB3),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildIndicatorPasswordLength() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    spacing: 15,
    children: [
      Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.tealAccent,
        ),
      ),
      Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.tealAccent,
        ),
      ),
      Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.tealAccent,
        ),
      ),
    ],
  );
}


// String yape_mjer = ""