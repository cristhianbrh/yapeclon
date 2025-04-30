import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gridicons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/subway.dart';

class ListcontactScreen extends StatelessWidget {
  const ListcontactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Inicio')),
      body: SafeArea(
        child: Column(
          // Usar Column en lugar de SingleChildScrollView para evitar el error
          children: [
            _topHeader(context),
            _headerPageView(),
            SizedBox(height: 20),
            Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 0),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Iconify(Subway.search, color: Colors.black26),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ingresa celular o busca contacto",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(62, 34, 34, 17),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              // Aquí hemos agregado Expanded para evitar el desbordamiento
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      _ContactView(context),
                      _ContactView(context),
                      _ContactView(context),
                      _ContactView(context),
                      _ContactView(context),
                      _ContactView(context),
                      _ContactView(context),
                      _ContactView(context),
                      _ContactView(context),
                      _ContactView(context),
                      _ContactView(context),
                      _ContactView(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        spacing: 20,
        children: [
          IconButton(
            icon: Iconify(
              MaterialSymbols.close_rounded,
              color: Colors.black45,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/house");
            },
          ),
          Text(
            "Yapear",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget _headerPageView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // Sombra negra con opacidad
            spreadRadius: -5, // Qué tanto se extiende
            blurRadius: 5, // Qué tan difusa es la sombra
            offset: Offset(0, 7), // Desplazamiento (x, y)
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.purple, width: 5),
                ),
              ),
              child: Center(
                child: Text(
                  "Contactos",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.transparent, width: 5),
                ),
              ),
              child: Center(
                child: Text(
                  "Yapeos pendientes",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ContactView(context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "100 Soles Probl",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Text(
                "955 274 602",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                // Aquí colocas lo que debe pasar al hacer clic
                Navigator.pushNamed(context, "/yapear");
              },
              behavior: HitTestBehavior.translucent,
              child: Container(), // Invisible
            ),
          ),
        ],
      ),
    );
  }
}
