import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/teenyicons.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(12, (index) {
      if (index == 9) {
        return SizedBox.shrink();
      } else if (index == 11) {
        return _buildButtonLogin(
          onPressed: () {},
          isIcon: true,
          icon: const Iconify(
            Mdi.clear,
            size: 28,
            color: Color.fromARGB(60, 0, 0, 0),
          ),
          bgColor: Colors.transparent,
        );
      }

      return _buildButtonLogin(label: '${index + 1}', onPressed: () => {});
    });

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
      backgroundColor: const Color.fromARGB(62, 255, 255, 255),
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
        spacing: 3,
        children: [
          Iconify(
            '<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15"><path fill="none" stroke="#b44848" d="M12.5 12.5a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1Zm0 0a2 2 0 0 1-2 2H8m6.5-4.5V7.5a7 7 0 1 0-14 0V10m2 2.5a1 1 0 0 0 1-1v-4a1 1 0 0 0-1-1a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2Z" stroke-width="1.4"/></svg>',
            size: 20,
            color: Colors.white,
          ),
          SizedBox(width: 4), // separación entre ícono y texto
          Text("Ayuda", style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    ),
  );
}

Widget _buildButtonLogin({
  String? label,
  VoidCallback? onPressed,
  bool isIcon = false,
  Iconify? icon,
  Color? bgColor,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(10, 10),
      backgroundColor: bgColor ?? const Color.fromARGB(18, 49, 49, 49),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      elevation: 0,
    ),
    child: Center(
      child:
          isIcon
              ? icon ?? const SizedBox()
              : Text(
                label ?? '',
                style: const TextStyle(fontSize: 23, color: Colors.black),
              ),
    ),
  );
}
