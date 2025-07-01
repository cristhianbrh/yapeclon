import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import 'package:yapeclon/data/models/useinscreen/datadetails_model.dart';
import 'package:yapeclon/layouts/layout_main.dart';

class ViewYapearScreen extends StatefulWidget {
  const ViewYapearScreen({super.key});

  @override
  State<ViewYapearScreen> createState() => _ViewYapearScreenState();
}

class _ViewYapearScreenState extends State<ViewYapearScreen> {
  bool _isInit = false;
  late DatadetailsModel dataDetails;
  int ammountPreviousRoute = 3;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      dataDetails = args['dataDetails'] as DatadetailsModel;
      ammountPreviousRoute = args['ammountPreviousRoute'] as int;
      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutMain(
      child: Column(
        children: [
          //CODIFICA AQUÍ
          _topHeader(context),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dataDetails.ammount > 0 ? "¡Te yapearon!" : "¡Yapeaste!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Iconify(Tabler.share, color: Colors.tealAccent),
                        Text(
                          "COMPARTIR",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.tealAccent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  spacing: 3,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "S/",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      dataDetails.ammount.abs().toString(),
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.black87,
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
                Text(
                  dataDetails.nameUser,
                  // "Eydi E. Medina V.",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      formatDateTime(dataDetails.date),
                      // "📅 22 may. 2025 | 🕒 03:29 p. m.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                if (dataDetails.description != null)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                        13,
                        0,
                        18,
                        57,
                      ), // Blanco semitransparente
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    width: double.infinity,
                    child: Row(
                      spacing: 5,
                      children: [
                        Iconify(
                          IconParkOutline.message,
                          size: 15,
                          color: Colors.purple,
                        ),
                        Text(
                          // dataDetails.descriptionTransaction ??
                          "${dataDetails.description}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                Divider(
                  color: Colors.black12, // Color de la línea
                  thickness: 1.0, // Grosor de la línea
                  height: 20.0, // Espaciado vertical
                ),
                _securityCodeWidget(dataDetails.codeSecurity),
                Divider(
                  color: Colors.black12, // Color de la línea
                  thickness: 1.0, // Grosor de la línea
                  height: 20.0, // Espaciado vertical
                ),
                _dataViewWidget(
                  "Nro. de celular",
                  "*** *** ${dataDetails.phone.substring(6, dataDetails.phone.length)}",
                ),
                _dataViewWidget("Destino", "Yape"),

                _dataViewWidget("Nro. de operación", dataDetails.operation),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return '';

    final days = [
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

    final day = dateTime.day.toString().padLeft(2, '0');
    final month = days[dateTime.month - 1];
    final year = dateTime.year;

    int hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final isPm = hour >= 12;

    // Formato 12 horas
    hour = hour % 12;
    if (hour == 0) hour = 12;

    final period = isPm ? 'p. m.' : 'a. m.';

    return '📅 $day $month. $year | 🕒 ${hour.toString().padLeft(2, '0')}:$minute $period';
  }

  Widget _topHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset("assets/images/icons/yape_logo.png"),
            height: 100,
            padding: EdgeInsets.only(top: 10),
            // fit: BoxFit.contain,
          ),

          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white12, // Blanco semitransparente
              shape: BoxShape.circle, // Fondo redondo
            ),
            child: IconButton(
              icon: Iconify(
                MaterialSymbols.close_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                // Navigator.pop(context);
                int count = 0;
                Navigator.of(
                  context,
                ).popUntil((_) => count++ >= ammountPreviousRoute);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataViewWidget(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _securityCodeWidget(String code) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "CÓDIGO DE SEGURIDAD",
          style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          spacing: 5,
          children: [_boxCode(code[0]), _boxCode(code[1]), _boxCode(code[2])],
        ),
      ],
    );
  }

  Widget _boxCode(String code) {
    return Container(
      width: 25,
      decoration: BoxDecoration(
        color: Colors.black12, // Blanco semitransparente
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        code,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
