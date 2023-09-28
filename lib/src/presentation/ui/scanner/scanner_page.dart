import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:waitress_project/src/presentation/ui/pin/pin_page.dart';

import '../../../core/keys.dart';
import '../../utils/Colors.dart';
import '../../utils/route_animat.dart';
import '../../widgets/common_button.dart';
import '../../widgets/custom_appbar.dart';
import '../navigation/navigation.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool scannedQr = false;
  bool validQr = false;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      scannedQr = true;
      setState(() {});

      String code = scanData.code ?? "";
      List<String> splitStrings = code.split(';');

      // Check if both parts are available
      if (splitStrings.length == 2) {
        Keys.baseUrl = "http://" + splitStrings[0] + "/api";
        Keys.token = splitStrings[1];
        validQr = true;
      } else {
        validQr = false;
        // Handle the error appropriately, maybe set some default values or show a message
        print("Invalid QR Code format");
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        withBack: true,
        title: "Вернуться",
      ),
      backgroundColor: MyColors.backgroundLight,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
                borderColor: scannedQr ? MyColors.activeTextLight : MyColors.whiteText,
                borderRadius: 8.r,
                borderLength: 30,
                borderWidth: 3.h,
                cutOutSize: 240.h,
                cutOutBottomOffset: 100.h),
          ),
          scannedQr
              ? Positioned(
                  bottom: 125.h,
                  child: CommonButtonWidget(
                    titleColor: MyColors.whiteText,
                    onTaps: () {
                      if (validQr) {
                        Navigator.of(context).push(AnimateRoute.createRoute(const PinPage()));
                      } else {}
                    },
                    colorOfButton: MyColors.activeTextLight,
                    title: "Продолжить",
                  ),
                )
              : Container(),
          Positioned(
            bottom: 55.h,
            child: CommonButtonWidget(
              titleColor: MyColors.notActiveTextLight,
              onTaps: () {
                Navigator.pop(context);
              },
              colorOfButton: MyColors.backgroundLight,
              title: "Ввести в ручную",
            ),
          )
        ],
      ),
    );
  }
}
