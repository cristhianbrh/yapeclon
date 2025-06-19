import 'package:yapeclon/widgets/buttons/button_main_widget.dart';
import 'package:yapeclon/layouts/layout_card_view_details.dart';
import 'package:yapeclon/widgets/header/top_header_house.dart';
import 'package:yapeclon/data/services/firestore_service.dart';
import 'package:yapeclon/widgets/services_card_widget.dart';
import 'package:yapeclon/layouts/layout_panel_white.dart';
import 'package:yapeclon/data/models/user_model.dart';
import 'package:yapeclon/widgets/slider_widget.dart';
import 'package:yapeclon/layouts/layout_main.dart';
import 'package:flutter/material.dart';
import 'package:yapeclon/main.dart';
import 'package:yapeclon/widgets/views/movement_widget.dart';

class HouseScreen extends StatefulWidget {
  const HouseScreen({super.key});

  @override
  State<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> with RouteAware {
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
    print('print: Volviste al HouseScreen');
    _refrescarDatos(); // Aquí haces lo que quieras al volver al screen
  }

  void _refrescarDatos() async {
    print('print: ${userData?.email ?? 'No user data'}');
    print('print: ${userData?.password ?? 'No user data'}');

    if (userData == null) return;

    UserModel? userCurrentGet = await fs.getUserByEmailAndPassword(
      userData!.email,
      userData!.password,
      isHashed: true,
    );

    if (userCurrentGet != null) {
      setState(() {
        userData = userCurrentGet;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // userData = ModalRoute.of(context)!.settings.arguments as UserModel;
    if (userData == null) {
      return Center(child: CircularProgressIndicator());
    }
    return LayoutMain(
      child: Column(
        children: [
          TopHeaderHouse(user: userData!),
          ServicesCardWidget(),
          SliderWidget(),
          _contentBodyHouse(userData!),
        ],
      ),
    );
  }

  Widget _contentBodyHouse(UserModel user) {
    return Expanded(
      child: LayoutPanelWhite(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 10, // Quitar si no es necesario
              children: [
                LayoutCardViewDetails(
                  text: "Mostrar saldo",
                  typeView: EnumtypeView.right,
                  icon: Icons.remove_red_eye,
                  rightData: Text(
                    "S/ ${user.money.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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
                            () => setState(
                              () => _viewMovements = !_viewMovements,
                            ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide.none,
                          ),
                          elevation: 0,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: Size(0, 0),
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
                                children: [
                                  Icon(Icons.filter_list, color: Colors.purple),
                                  SizedBox(width: 8),
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
                                _viewMovements
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: Colors.black26,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (_viewMovements)
                        SizedBox(
                          height: 140,
                          child: SingleChildScrollView(
                            child: Column(
                              children:
                                  user.transactions
                                      .map((tx) => MovementWidget(tx))
                                      .toList(),
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
                ButtonMainWidget(
                  text: 'ESCANEAR QR',
                  icon: Icons.qr_code,
                  fontSize: 15,
                  onPressed: () {
                    Navigator.pushNamed(context, "/live-code", arguments: user);
                  },
                ),
                ButtonMainWidget(
                  text: 'YAPEAR',
                  icon: Icons.send,
                  backgroundColor: Color(0xFF0FCBB3),
                  color: Colors.white,
                  borderSide: BorderSide.none,
                  fontSize: 15,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/listcontact",
                      arguments: user,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para mostrar un movimiento
