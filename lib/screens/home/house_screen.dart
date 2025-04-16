import 'package:flutter/material.dart';
import 'package:yapeclon/widgets/services_card_widget.dart';
import 'package:yapeclon/widgets/slider_widget.dart';

class HouseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Inicio')),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 148, 102, 168), Color(0xFF720e9e)],
            ),
          ),
          child: Column(
            children: [
              _topHeaderHouse(),
              ServicesCardWidget(),
              SliderWidget(),
              _contentBodyHouse(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _topHeaderHouse() {
  return Container(
    padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => {},
          icon: Icon(Icons.menu_rounded, color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hola, Cristhian A...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      "Gratis",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(10, 10),
                      backgroundColor: Colors.amber,
                      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.headset_mic_outlined,
                color: Colors.white,
                size: 22,
              ),
            ),
            IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 22,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _contentBodyHouse() {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 10,
            children: [
              Container(
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
                    Icon(Icons.remove_red_eye, color: Colors.purple),
                    Text(
                      "Mostrar saldo",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 120, 30, 136),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.filter_list, color: Colors.purple),
                        Text(
                          "Mostrar movimientos",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 120, 30, 136),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.expand_more, color: Colors.black26, size: 30),
                  ],
                ),
              ),
            ],
          ),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            shrinkWrap: true,
            childAspectRatio: 3,

            children: [
              ElevatedButton.icon(
                onPressed: () => {},
                icon: Icon(Icons.qr_code, color: Color(0xFF0FCBB3), size: 25),
                label: Text(
                  'ESCANEAR QR',
                  style: TextStyle(color: Color(0xFF0FCBB3), fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(color: Color(0xFF0FCBB3), width: 1),
                  // minimumSize: Size(double.infinity, 50),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => {},
                icon: Icon(Icons.send, color: Colors.white, size: 25),
                label: Text(
                  'YAPEAR',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0FCBB3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // minimumSize: Size(double.infinity, 10),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
