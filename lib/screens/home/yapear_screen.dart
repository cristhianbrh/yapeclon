import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:yapeclon/data/models/transaction_model.dart';
import 'package:yapeclon/data/models/useinscreen/datadetails_model.dart';
import 'package:yapeclon/data/models/useinscreen/datayapear_model.dart';
import 'package:yapeclon/widgets/buttons/button_main_widget.dart';

class YapearScreen extends StatefulWidget {
  const YapearScreen({super.key});

  @override
  State<YapearScreen> createState() => _YapearScreenState();
}

class _YapearScreenState extends State<YapearScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool isYapearEnabled = false;
  // double userMoney = 0;
  late DatayapearModel datayapearModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    datayapearModel =
        ModalRoute.of(context)!.settings.arguments as DatayapearModel;
    // userMoney = contactUsers.user.money;
    _amountController.addListener(_validateYapearButton);
  }

  void _validateYapearButton() {
    final montoText = _amountController.text.trim();
    final monto = double.tryParse(montoText);
    final isSameUser =
        datayapearModel.numberPhoneEmitter.replaceFirst("+51", "") ==
        datayapearModel.numberPhoneRecept.replaceFirst("+51", "");
    setState(() {
      isYapearEnabled =
          monto != null &&
          monto > 0 &&
          monto <= datayapearModel.moneyCurrent &&
          !isSameUser;
    });
  }

  @override
  void dispose() {
    _amountController.removeListener(_validateYapearButton);
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 115, 9, 144),
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
                datayapearModel.nameUserRecept,
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
                  controller: _descriptionController,
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
                  Expanded(
                    child: ButtonMainWidget(
                      text: 'OTROS BANCOS',
                      fontSize: 14,
                      onPressed: () {
                        Navigator.pushNamed(context, "/house");
                      },
                    ),
                  ),
                  Expanded(
                    child: ButtonMainWidget(
                      text: 'YAPEAR',
                      fontSize: 14,
                      color:
                          isYapearEnabled
                              ? Colors.white
                              : Color.fromARGB(176, 67, 68, 67),
                      backgroundColor:
                          isYapearEnabled
                              ? Color(0xFF0FCBB3)
                              : Color.fromARGB(255, 216, 210, 210),
                      isDisabled: !isYapearEnabled,
                      onPressed:
                          isYapearEnabled
                              ? () async {
                                final montoText = _amountController.text.trim();
                                final monto = double.tryParse(montoText);

                                if (monto == null || monto <= 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Ingresa un monto válido"),
                                    ),
                                  );
                                  return;
                                }

                                if (monto > datayapearModel.moneyCurrent) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Saldo insuficiente"),
                                    ),
                                  );
                                  return;
                                }

                                final date = DateTime.now();
                                final datecurrent =
                                    date.millisecondsSinceEpoch.toString();
                                final String code = codeGenerator();
                                final newTransactionEmitter = TransactionModel(
                                  id: datecurrent,
                                  amount: -monto,
                                  date: date,
                                  description:
                                      "Yape a ${datayapearModel.nameUserRecept}",
                                  descriptionTransaction:
                                      (_descriptionController.text.isNotEmpty)
                                          ? _descriptionController.text.trim()
                                          : null,
                                  destinationPhone:
                                      datayapearModel.numberPhoneRecept,
                                  status: 'pending', // Estado inicial
                                  codeSecurity: code,
                                );

                                final newTransactionRecept = TransactionModel(
                                  id: datecurrent,
                                  amount: monto,
                                  date: date,
                                  description:
                                      "Te ha yapeado " +
                                      datayapearModel.nameUserEmitter,
                                  descriptionTransaction:
                                      (_descriptionController.text.isNotEmpty)
                                          ? _descriptionController.text.trim()
                                          : null,
                                  destinationPhone:
                                      datayapearModel.numberPhoneEmitter,
                                  status: 'pending', // Estado inicial
                                  codeSecurity: code,
                                );

                                final userEmitterRef = FirebaseFirestore
                                    .instance
                                    .collection('users')
                                    .doc(datayapearModel.numberPhoneEmitter);
                                final userReceptRef = FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(datayapearModel.numberPhoneRecept);

                                // GUARDAR EN FIRESTORE
                                try {
                                  await userEmitterRef.update({
                                    'money': FieldValue.increment(-monto),
                                    'transactions': FieldValue.arrayUnion([
                                      newTransactionEmitter.toMap(),
                                    ]),
                                  });
                                  await userReceptRef.update({
                                    'money': FieldValue.increment(monto),
                                    'transactions': FieldValue.arrayUnion([
                                      newTransactionRecept.toMap(),
                                    ]),
                                  });

                                  // Navigator.pop(
                                  //   context,
                                  // ); // Regresa a la pantalla anterior

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Yape realizado con éxito"),
                                    ),
                                  );

                                  Navigator.pushNamed(
                                    context,
                                    "/view-yapear",
                                    arguments: {
                                      "dataDetails": DatadetailsModel(
                                        nameUser:
                                            datayapearModel.nameUserEmitter,
                                        phone:
                                            datayapearModel.numberPhoneRecept,
                                        codeSecurity: code,
                                        operation: "18945451",
                                        ammount: monto,
                                        description:
                                            (_descriptionController.text
                                                    .trim()
                                                    .isNotEmpty)
                                                ? _descriptionController.text
                                                    .trim()
                                                : null,
                                        date: date,
                                      ),
                                      "ammountPreviousRoute": 3,
                                    },
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Error al yapear: $e"),
                                    ),
                                  );
                                }

                                // Navigator.pop(context);
                              }
                              : () {},
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

  String codeGenerator() {
    final random = Random();
    // número entre 0 y 9
    int num1 = random.nextInt(10);
    int num2 = random.nextInt(10);
    int num3 = random.nextInt(10);
    return "$num1$num2$num3";
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
