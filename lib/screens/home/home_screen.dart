import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Inicio')),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 148, 102, 168), Color(0xFF720e9e)],
            ),
          ),
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
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed:
                            () => {Navigator.pushNamed(context, "/login")},
                        child: Text(
                          'Ingresar',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white30,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                          side: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed:
                            () => {
                              Navigator.pushNamed(context, "/crear-cuenta"),
                            },
                        child: Text(
                          'Crear Cuenta',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0FCBB3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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