import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
      11,
      (index) => ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(10, 10),
          backgroundColor: const Color.fromARGB(18, 49, 49, 49),
          padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          elevation: 0,
        ),

        child: Center(
          child: Text("1", style: TextStyle(fontSize: 23, color: Colors.black)),
        ),
      ),
    );

    return Scaffold(
      // appBar: AppBar(title: Text('Inicio')),
      backgroundColor: Color(0xFF720e9e),
      body: SafeArea(
        child: Container(
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
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: _ButtonHelp(),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 150,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/images/QR/IMG_LOGIN_QR.jpg",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  bottom: 20,
                  right: 20,
                  top: 33,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(61, 70, 70, 70),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Text(
                      "Ingresa tu clave",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 120, 30, 136),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 33),
                    Container(
                      height: 216,
                      // color: Colors.red,
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2.15,
                        children: items,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "¿OLVIDASTE TU CLAVE?",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 32, 213, 168),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _ButtonHelp() {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(80, 255, 255, 255),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
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
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        mainAxisSize:
            MainAxisSize.min, // <-- importante para que Row no se expanda
        children: [
          Icon(Icons.headset_mic_outlined, size: 25, color: Colors.white),
          SizedBox(width: 4), // separación entre ícono y texto
          Text("Ayuda", style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    ),
  );
}
