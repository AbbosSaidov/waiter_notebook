import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../utils/Colors.dart';
import '../../utils/route_animat.dart';
import '../../widgets/common_button.dart';
import '../../widgets/custom_appbar.dart';
import '../scanner/scanner_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundLight,
      body: Column(
        children: [
          SizedBox(
            height: 143.h,
          ),
          Image.asset("assets/icons/logo_light.png",height: 242.h,width: 242.h,),
          const Spacer(),
          CommonButtonWidget(
            titleColor: MyColors.whiteText,
            onTaps: () {
              Navigator.of(context).push(AnimateRoute.createRoute(const ScannerPage()));
            },
            colorOfButton: MyColors.activeTextLight,
            title: "Начать",
          ),
          SizedBox(
            height: 63.h,
          )
        ],
      ),
    );
  }
}
