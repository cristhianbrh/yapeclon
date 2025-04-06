import 'package:flutter/material.dart';

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
          child: Column(children: [_topHeaderHouse(), _bodyServicesHouse()]),
        ),
      ),
    );
  }
}

Widget _topHeaderHouse() {
  return Container(
    padding: EdgeInsets.all(12),
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

Widget _bodyServicesHouse() {
  return Expanded(
    // 👈 Este es el cambio clave
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: .8,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return _serviceCardView(context, index);
        },
      ),
    ),
  );
}

Widget _serviceCardView(context, index) {
  return Container(
    padding: EdgeInsets.all(6),
    decoration: BoxDecoration(
      // color: Colors.amber,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(
            child: Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 22,
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Recargar celular', // texto largo como prueba
          style: TextStyle(color: Colors.white, fontSize: 12),
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ],
    ),
  );
}
