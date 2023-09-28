import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waitress_project/src/presentation/utils/route_animat.dart';

import '../../../core/keys.dart';
import '../../../domain/repositories/repository_main.dart';
import '../../utils/Colors.dart';
import '../../widgets/common_button.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_keyboard.dart';
import '../navigation/navigation.dart';

class PinPage extends StatefulWidget {
  const PinPage({Key? key}) : super(key: key);

  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  String code="";
  final repo = RepositoryMain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        withBack: true,
        title: "Вернуться",
      ),
      backgroundColor: MyColors.backgroundLight,
      body: SizedBox(
        height: 603.h,
        width: 363.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.h,),
            Row(
              children: [
                SizedBox(width: 22.w,),
                Text(
                "Ведите код сотрудника",
                  style: TextStyle(
                    fontSize: 17.h,
                    color: MyColors.blackText,
                    fontFamily: "sfBold",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            Text(
              code,
              style: TextStyle(
                fontSize: 24.h,
                color: MyColors.blackText,
                fontFamily: "sfBold",
              ),
            ),
            const Spacer(),
            CustomKeyboardWidget(
              onTap1: () {
                if(code.length<6){
                  code=code+"1";
                  setState(() {});
                }
              },
              onTap2: () {
                if(code.length<6){
                  code=code+"2";
                  setState(() {});
                }
              },
              onTap3: () {
                if(code.length<6){
                  code=code+"3";
                  setState(() {});
                }
              },
              onTap4: () {
                if(code.length<6){
                  code=code+"4";
                  setState(() {});
                }
              },
              onTap5: () {
                if(code.length<6){
                  code=code+"5";
                  setState(() {});
                }
              },
              onTap6: () {
                if(code.length<6){
                  code=code+"6";
                  setState(() {});
                }
              },
              onTap7: () {
                if(code.length<6){
                  code=code+"7";
                  setState(() {});
                }
              },
              onTap8: () {
                if(code.length<6){
                  code=code+"8";
                  setState(() {});
                }
              },
              onTap9: () {
                if(code.length<6){
                  code=code+"9";
                  setState(() {});
                }
              },
              onTap0: () {
                if(code.length<6){
                  code=code+"0";
                  setState(() {});
                }
              },
              onTapRemove: () {
                if(code.isNotEmpty){
                  code=code.substring(0,code.length-1);
                  setState(() {});
                }
              },
            ),
            CommonButtonWidget(
              titleColor: MyColors.whiteText,
              onTaps: () async {
                Keys.authCode=code;
                bool auth = (await repo.authCheck(code)) ;
                if(auth){
                  Navigator.of(context).pushAndRemoveUntil(
                    AnimateRoute.createRoute(const NavigationPage()),
                        (Route<dynamic> route) => false,
                  );
                }
              },
              colorOfButton: MyColors.activeTextLight,
              title: "Продолжить",
            ),
            SizedBox(height: 34.h,)
          ],
        ),
      ),
    );
  }
}
