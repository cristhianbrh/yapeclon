import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gridicons.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:yapeclon/data/models/user_model.dart';
import 'package:yapeclon/data/services/firestore_service.dart';
import 'package:yapeclon/data/models/useinscreen/datayapear_model.dart';

///
/// Created by
/// Rafaelbarbosatec
/// on 28/06/22
class LiveDecodePage extends StatefulWidget {
  static const routeName = '/live';
  static get route => {
    routeName: (BuildContext context) => const LiveDecodePage(),
  };
  static open(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  const LiveDecodePage({Key? key}) : super(key: key);

  @override
  LiveDecodePageState createState() => LiveDecodePageState();
}

class LiveDecodePageState extends State<LiveDecodePage> {
  Result? currentResult;
  final QRCodeDartScanController _controller = QRCodeDartScanController();
  bool _isFlashOn = false; // Variable para rastrear el estado del flash

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final FirestoreService fs = FirestoreService();
    final userData = ModalRoute.of(context)!.settings.arguments as UserModel;
    print("print: " + userData.phone);

    return Scaffold(
      body: QRCodeDartScanView(
        controller: _controller,
        scanInvertedQRCode: true,
        resolutionPreset: QRCodeDartScanResolutionPreset.high,
        onCapture: (Result result) async {
          await _controller.stopScan();
          final numberQr = result.text.replaceFirst("+51", "");
          print("print: numberQr: $numberQr");
          print("print: userData.phone: ${userData.phone}");
          if (RegExp(r'^\d+$').hasMatch(numberQr)) {
            UserModel? userEnv = await fs.getUserByNumber(numberQr);
            if (userEnv != null) {
              Navigator.pushNamed(
                context,
                "/yapear",
                arguments: DatayapearModel(
                  moneyCurrent: userData.money,
                  nameUserEmitter: userData.fullName,
                  nameUserRecept: userEnv.fullName,
                  numberPhoneEmitter: userEnv.phone,
                  numberPhoneRecept: userEnv.phone,
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("El usuario no tiene Yape."),
                  duration: Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          }
          print("addmer");
          setState(() {
            currentResult = result;
            print(result);
          });
          await _controller.startScan();
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await _controller
                                .toggleFlash(); // Activar/desactivar flash
                            setState(() {
                              _isFlashOn = !_isFlashOn; // Cambiar el estado
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _isFlashOn ? Colors.blue : Colors.white60,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            _isFlashOn
                                ? 'Apagar linterna'
                                : 'Encender linterna',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: double.infinity,
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            // await controller?.toggleFlash();
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            children: [
                              Iconify(
                                Gridicons.add_image,
                                color: Colors.purpleAccent,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Subir una imagen con QR',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
