import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class CreatePasswordScreen extends StatelessWidget {
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
            color: Color.fromARGB(193, 255, 254, 254),
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
                    Center(child: _buildIndicatorPasswordLength()),
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

Widget _buildIndicatorPasswordLength() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    spacing: 15,
    children: [
      Container(
        height: 13,
        width: 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.tealAccent,
        ),
      ),
      Container(
        height: 13,
        width: 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.tealAccent,
        ),
      ),
      Container(
        height: 13,
        width: 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.tealAccent,
        ),
      ),
      Container(
        height: 13,
        width: 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.tealAccent,
        ),
      ),
      Container(
        height: 13,
        width: 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.tealAccent,
        ),
      ),
      Container(
        height: 13,
        width: 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.tealAccent,
        ),
      ),
    ],
  );
}
