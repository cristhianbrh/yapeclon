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
          backgroundColor: Colors.amber,
          padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        child: Center(
          child: Text("1", style: TextStyle(fontSize: 30, color: Colors.white)),
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
                padding: EdgeInsets.all(20),
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
                    Container(
                      height: 345,
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.6,
                        children: items,
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
