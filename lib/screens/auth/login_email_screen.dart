import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/teenyicons.dart';

class LoginEmailScreen extends StatefulWidget {
  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  String password = "";
  List<int> numeros = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  final TextEditingController _emailDocController = TextEditingController();

  @override
  void initState() {
    super.initState();
    numeros.shuffle(); // Ahora sí es válido
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(12, (index) {
      if (index == 9) {
        return SizedBox.shrink();
      } else if (index == 11) {
        return _buildButtonLogin(
          onPressed: () {
            if (password.isNotEmpty) {
              setState(() {
                password = password.substring(0, password.length - 1);
              });
            }
          },
          isIcon: true,
          icon: const Iconify(
            Mdi.clear,
            size: 28,
            color: Color.fromARGB(60, 0, 0, 0),
          ),
          bgColor: Colors.transparent,
        );
      }

      return _buildButtonLogin(
        label: '${numeros[index < 9 ? index : 9]}',
        onPressed: () {
          if (password.length < 6) {
            // Agregar número al password y luego evaluar
            String nuevoPassword =
                password + numeros[index < 9 ? index : 9].toString();

            setState(() {
              password = nuevoPassword;
            });

            if (nuevoPassword == "123456") {
              // Si es correcto, navegar y resetear después
              Navigator.pushNamed(context, "/house");
              Future.delayed(Duration(milliseconds: 100), () {
                setState(() {
                  password = "";
                  numeros.shuffle();
                });
              });
            } else if (nuevoPassword.length >= 6) {
              // Si no es correcto pero ya hay 6 dígitos, reiniciar
              Future.delayed(Duration(milliseconds: 100), () {
                setState(() {
                  password = "";
                  numeros.shuffle();
                });
              });
            }

            print(nuevoPassword);
          }
        },
      );
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
              Container(
                height: 150,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/icons/bg_yape_1.jpg',
                    ), // Ruta a tu imagen
                    fit: BoxFit.cover, // Puedes usar cover, contain, fill, etc.
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: _ButtonHelp(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
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
                        "Ingresa a tu Yape",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 120, 30, 136),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 50),
                      _buildTextField(
                        "Correo electrónico",
                        TextInputType.emailAddress,
                        _emailDocController,
                        "nombre@gmail.com",
                      ),
                      SizedBox(height: 33),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:
                              () => {Navigator.pushNamed(context, "/login")},
                          child: Text(
                            'Continuar',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                            side: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
          Text("Ayuda", style: TextStyle(fontSize: 14, color: Colors.white)),
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

Widget _buildIndicatorPasswordLength(String password) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    spacing: 15,
    children: [
      for (var i = 1; i <= 6; i++)
        (Container(
          height: i <= password.length ? 13 : 10,
          width: i <= password.length ? 13 : 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: i <= password.length ? Colors.tealAccent : Colors.grey[300],
          ),
        )),
    ],
  );
}
