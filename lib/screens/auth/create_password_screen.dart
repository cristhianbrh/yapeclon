import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:yapeclon/data/models/user_model.dart';
import 'package:yapeclon/data/services/firestore_service.dart';

class CreatePasswordScreen extends StatefulWidget {
  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  String password = "";
  List<int> numeros = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @override
  void initState() {
    super.initState();
    numeros.shuffle(); // Ahora sí es válido
  }

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)!.settings.arguments as UserModel;

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

            if (nuevoPassword.length == 6) {
              // Si es correcto, navegar y resetear después
              UserModel newUser = UserModel(
                typeDoc: userData.typeDoc,
                document: userData.document,
                email: userData.email,
                phone: userData.phone,
                password: password,
                fullName: userData.fullName,
              );
              FirestoreService fs = FirestoreService();
              fs.addUser(newUser);

              Navigator.pushNamed(context, "/house", arguments: newUser);
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
              Expanded(
                child: Center(
                  child: Container(
                    // height: 100,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    // color: Colors.amber,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Container(
                        //   alignment: Alignment.centerRight,
                        //   child: _ButtonHelp(),
                        // ),
                        Center(
                          child: Column(
                            spacing: 5,
                            children: [
                              Iconify(
                                '<svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24"><path fill="#d091d5" d="M12 17a2 2 0 0 0 2-2a2 2 0 0 0-2-2a2 2 0 0 0-2 2a2 2 0 0 0 2 2m6-9a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V10a2 2 0 0 1 2-2h1V6a5 5 0 0 1 5-5a5 5 0 0 1 5 5v2zm-6-5a3 3 0 0 0-3 3v2h6V6a3 3 0 0 0-3-3"/><path fill="#0fc9b1" transform="translate(12, 13) scale(.6)" fill-rule="evenodd" d="M3.91 8a.91.91 0 0 0-.91.91v6.18c0 .503.407.91.91.91h16.18a.91.91 0 0 0 .91-.91V8.91a.91.91 0 0 0-.91-.91zM7 13.5a1.5 1.5 0 1 0 0-3a1.5 1.5 0 0 0 0 3m6.5-1.5a1.5 1.5 0 1 1-3 0a1.5 1.5 0 0 1 3 0m3.5 1.5a1.5 1.5 0 1 0 0-3a1.5 1.5 0 0 0 0 3" clip-rule="evenodd"/></svg>',
                                size: 80,
                                // color: Color.fromARGB(193, 255, 254, 254),
                              ),
                              Text(
                                "Crea tu clave Yape",
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Clave de 6 dígitos",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white60,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  bottom: 0,
                  right: 20,
                  top: 33,
                ),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: const Color.fromARGB(61, 70, 70, 70),
                  //     spreadRadius: 2,
                  //     blurRadius: 6,
                  //     offset: Offset(2, 3),
                  //   ),
                  // ],
                ),

                child: Column(
                  children: [
                    Center(
                      child:
                          password.length == 0
                              ? Text(
                                "Ingresa tu clave",
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    180,
                                    164,
                                    183,
                                  ),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                              : _buildIndicatorPasswordLength(password),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 275,
                      // color: Colors.red,
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.8,
                        children: items,
                      ),
                    ),
                    SizedBox(height: 30),
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
      backgroundColor: bgColor ?? const Color.fromARGB(57, 249, 249, 249),
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
                style: const TextStyle(fontSize: 23, color: Colors.white),
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
