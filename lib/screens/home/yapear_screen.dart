import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';
import 'package:iconify_flutter/icons/icon_park_solid.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mingcute.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:yapeclon/data/models/contact_user.dart';
import 'package:yapeclon/data/models/transaction_model.dart';
import 'package:yapeclon/data/models/user_model.dart';

class YapearScreen extends StatefulWidget {
  const YapearScreen({super.key});

  @override
  State<YapearScreen> createState() => _YapearScreenState();
}

class _YapearScreenState extends State<YapearScreen> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final contactUsers =
        ModalRoute.of(context)!.settings.arguments as ContactUserArgs;

    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      // appBar: AppBar(title: Text('Inicio')),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [Color.fromARGB(255, 148, 102, 168), Color(0xFF720e9e)],
            // ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              //CODIFICA AQUÍ
              _topHeader(context),
              Text(
                contactUsers.contact.displayName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.purple,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "S/",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 40,
                            color: Colors.purple,
                          ),
                        ),
                        IntrinsicWidth(
                          child: Material(
                            type:
                                MaterialType
                                    .transparency, // Evita el estilo predeterminado de Material
                            child: TextField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 80,
                                color:
                                    Colors
                                        .purple, // Cambia el color si es necesario
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                hintText: "0",
                                hintStyle: TextStyle(
                                  fontSize: 80,
                                  color: Color.fromARGB(
                                    62,
                                    34,
                                    34,
                                    17,
                                  ), // Ajusta el color del hint
                                ),
                                // Todos los bordes son nulos
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Puedes yapear hasta S/ 500 diarios",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black12, width: 1.0),
                  ),
                ),
                child: TextField(
                  textAlign:
                      TextAlign
                          .center, // Centra el hintText y el texto ingresado
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: "Agregar mensaje",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(62, 34, 34, 17),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 50),

              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                shrinkWrap: true,
                childAspectRatio: 3,
                padding: EdgeInsets.symmetric(horizontal: 20),

                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/house");
                    },
                    child: Text(
                      'OTROS BANCOS',
                      style: TextStyle(color: Color(0xFF0FCBB3), fontSize: 14),
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
                  ElevatedButton(
                    onPressed: () async {
                      final montoText = _amountController.text.trim();
                      final monto = double.tryParse(montoText);

                      if (monto == null || monto <= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Ingresa un monto válido")),
                        );
                        return;
                      }

                      if (monto > contactUsers.user.money) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Saldo insuficiente")),
                        );
                        return;
                      }

                      final newTransaction = TransactionModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        amount: monto,
                        date: DateTime.now(),
                        description:
                            "Yape a ${contactUsers.contact.displayName}",
                        destinationPhone: contactUsers.user.phone,
                      );

                      final updatedUser = UserModel(
                        phone: contactUsers.user.phone,
                        typeDoc: contactUsers.user.typeDoc,
                        document: contactUsers.user.document,
                        email: contactUsers.user.email,
                        password: contactUsers.user.password,
                        fullName: contactUsers.user.fullName,
                        money: contactUsers.user.money - monto,
                        transactions: [
                          ...contactUsers.user.transactions,
                          newTransaction,
                        ],
                      );

                      // GUARDAR EN FIRESTORE
                      try {
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(contactUsers.user.phone)
                            .set(updatedUser.toMap());

                        Navigator.pop(
                          context,
                        ); // Regresa a la pantalla anterior

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Yape realizado con éxito")),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error al yapear: $e")),
                        );
                      }

                      Navigator.pop(context);
                    },
                    child: Text(
                      'YAPEAR',
                      style: TextStyle(
                        color: Color.fromARGB(176, 67, 68, 67),
                        fontSize: 14,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 216, 210, 210),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(color: Color(0xFF0FCBB3), width: 1),
                      // minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
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
            icon: Iconify(Ph.caret_left_bold, color: Colors.black45, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Text(
              "Yapear a",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          IconButton(
            icon: Iconify(
              MaterialSymbols.close_rounded,
              color: Colors.black45,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
