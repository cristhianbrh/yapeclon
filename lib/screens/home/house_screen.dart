import 'package:flutter/material.dart';
import 'package:yapeclon/data/models/transaction_model.dart';
import 'package:yapeclon/data/models/user_model.dart';
import 'package:yapeclon/data/services/firestore_service.dart';
import 'package:yapeclon/main.dart';
import 'package:yapeclon/widgets/services_card_widget.dart';
import 'package:yapeclon/widgets/slider_widget.dart';

class HouseScreen extends StatefulWidget {
  @override
  State<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> with RouteAware {
  bool _viewSaldo = false;
  bool _viewMovements = false;
  UserModel? userData;
  FirestoreService fs = FirestoreService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);

    // Solo asignar si aún no está asignado
    if (userData == null) {
      final args = ModalRoute.of(context)!.settings.arguments;
      if (args != null && args is UserModel) {
        userData = args;
      }
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    print('Volviste al HouseScreen');
    _refrescarDatos(); // Aquí haces lo que quieras al volver al screen
  }

  void _refrescarDatos() async {
    if (userData == null) return;

    UserModel? userCurrentGet = await fs.getUserByEmailAndPassword(
      userData!.email,
      userData!.password,
    );

    if (userCurrentGet != null) {
      print(userCurrentGet.money);
      setState(() {
        userData = userCurrentGet;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // userData = ModalRoute.of(context)!.settings.arguments as UserModel;

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
              _topHeaderHouse(userData!),
              ServicesCardWidget(),
              SliderWidget(),
              _contentBodyHouse(userData!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentBodyHouse(UserModel user) {
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
                ElevatedButton(
                  onPressed:
                      () => {
                        setState(() {
                          _viewSaldo = !_viewSaldo;
                        }),
                      },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(62, 255, 255, 255),
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ), // control del espacio interno
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide.none,
                    ),
                    elevation: 0,
                    tapTargetSize:
                        MaterialTapTargetSize
                            .shrinkWrap, // <-- evita que se expanda más de lo necesario
                    minimumSize: Size(
                      0,
                      0,
                    ), // <-- para permitir que el botón se achique
                  ),
                  child: Container(
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
                        Expanded(child: Container()),
                        if (_viewSaldo)
                          Text(
                            "S/ " + user.money.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
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
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed:
                            () => {
                              setState(() {
                                _viewMovements = !_viewMovements;
                              }),
                            },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor:
                              Colors.transparent, // <-- quitar la sombra
                          surfaceTintColor:
                              Colors
                                  .transparent, // <-- quitar el efecto de elevación
                          splashFactory:
                              NoSplash
                                  .splashFactory, // <-- quitar el splash de clic
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ), // control del espacio interno
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide.none,
                          ),
                          elevation: 0,
                          tapTargetSize:
                              MaterialTapTargetSize
                                  .shrinkWrap, // <-- evita que se expanda más de lo necesario
                          minimumSize: Size(
                            0,
                            0,
                          ), // <-- para permitir que el botón se achique
                        ).copyWith(
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
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
                                      color: const Color.fromARGB(
                                        255,
                                        120,
                                        30,
                                        136,
                                      ),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.expand_more,
                                color: Colors.black26,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (_viewMovements)
                        Container(
                          height: 140,
                          child: SingleChildScrollView(
                            child: Column(
                              children:
                                  user.transactions.map((tx) {
                                    return _movementWidget(tx);
                                  }).toList(),
                            ),
                          ),
                        ),
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
                  onPressed: () {
                    Navigator.pushNamed(context, "/scanner");
                  },
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
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/listcontact",
                      arguments: user,
                    );
                  },
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
}

String _formatDate(DateTime date) {
  final months = [
    'ene',
    'feb',
    'mar',
    'abr',
    'may',
    'jun',
    'jul',
    'ago',
    'sep',
    'oct',
    'nov',
    'dic',
  ];
  final day = date.day;
  final month = months[date.month - 1];
  final year = date.year;
  final hour = date.hour.toString().padLeft(2, '0');
  final minute = date.minute.toString().padLeft(2, '0');

  return "$day $month. $year - $hour:$minute";
}

Widget _movementWidget(TransactionModel tx) {
  return Container(
    padding: EdgeInsetsDirectional.symmetric(vertical: 10),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tx.description,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              _formatDate(tx.date),
              style: TextStyle(
                color: Colors.black45,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Expanded(child: Container()),
        Text(
          "- S/ ${tx.amount.toStringAsFixed(2)}",
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget _topHeaderHouse(UserModel user) {
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
                    "Hola, " + user.fullName.substring(0, 9) + "...",
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
