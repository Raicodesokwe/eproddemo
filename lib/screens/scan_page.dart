import 'dart:io';

import 'package:eproddemo/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  QRViewController? controller;
  Barcode? barcode;
  final qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: AppColor.greenColor,
            borderLength: 20,
            borderWidth: 10,
            cutOutSize: size.width * 0.5),
      )),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((barcode) => setState(() {
          this.barcode = barcode;

          secondPageRoute();
        }));
  }

  secondPageRoute() async {
    controller?.pauseCamera();
//we pass the code to the alertdialog
    await showDialog(
      context: context,
      builder: (context) {
        Size size = MediaQuery.of(context).size;
        return AlertDialog(
          backgroundColor: AppColor.brownColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Center(
            child: Lottie.asset('assets/images/success.json'),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Authenticity confirmed!!!',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 7,
              ),
              Text(barcode!.code!),
              SizedBox(
                height: 7,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  width: size.width * 0.5,
                  child: Center(
                    child: Text(
                      'Ok',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: AppColor.greenColor,
                      borderRadius: BorderRadius.circular(8)),
                ),
              )
            ],
          ),
        );
      },
    ).then((value) => controller!.resumeCamera());
  }
}
