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
            children: [_topHeaderHouse(), ServicesCardWidget(), SliderWidget()],
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
