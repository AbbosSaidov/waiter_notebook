import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waitress_project/src/presentation/utils/Colors.dart';

import '../../widgets/common_button.dart';
import '../../widgets/custom_appbar.dart';

class CloseTablePage extends StatefulWidget {
  const CloseTablePage({Key? key}) : super(key: key);

  @override
  _CloseTablePageState createState() => _CloseTablePageState();
}

class _CloseTablePageState extends State<CloseTablePage> {
  int stateOfMenu = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backgroundLight,
        resizeToAvoidBottomInset: true,
        appBar: const CustomAppBar(
          withBack: true,
          title: "Стол №7",
        ),
        body: Padding(
          padding: EdgeInsets.only(right: 10.w, left: 10.w),
          child: ListView(
            children: [
              SizedBox(
                height: 15.w,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Зал:',
                          style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Text(
                          'Nimadir xonasi',
                          style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Статус:',
                          style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Text(
                          'Выдан',
                          style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.w,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Заказ:',
                          style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Text(
                          '№12345',
                          style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Количество гостей:',
                          style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Text(
                          '6',
                          style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.w,
              ),
              Container(
                height: 1,
                color: MyColors.appBarLight,
              ),
              SizedBox(
                height: 10.w,
              ),
              if (stateOfMenu == 0) ...savingItem(),
              if (stateOfMenu == 1) ...completed(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> savingItem() {
    return [
      Row(
        children: [
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Название:',
              style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Количество:',
              style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
            ),
          ),
          Text(
            '500 000 сумм',
            style: TextStyle(fontSize: 14.sp, color: Colors.transparent, fontFamily: "sf"),
          ),
          SizedBox(
            width: 2.w,
          ),
        ],
      ),
      SizedBox(
        height: 5.w,
      ),
      SizedBox(
        height: 100.h,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 3.h),
              height: 30.h,
              color: MyColors.appBarLight,
              child: Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Уйгурский лагман:',
                      style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'x6:',
                      style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
                    ),
                  ),
                  Text(
                    '500 000 сумм',
                    style: TextStyle(fontSize: 14.sp, color: MyColors.blackText, fontFamily: "sf"),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      SizedBox(
        height: 10.w,
      ),
      SizedBox(
        height: 170.w,
      ),
      CommonButtonWidget(
        onTaps: () {},
        colorOfButton: MyColors.notActiveTextLight,
        title: "Добавить гостя",
      ),
      SizedBox(
        height: 10.w,
      ),
      CommonButtonWidget(
        onTaps: () {},
        colorOfButton: MyColors.notActiveTextLight,
        title: "Добавить блюдо",
      ),
      SizedBox(
        height: 10.w,
      ),
      CommonButtonWidget(
        onTaps: () {
          stateOfMenu = 1;
          setState(() {});
        },
        colorOfButton: MyColors.activeTextLight,
        title: "Закрыть стол",
      ),
      SizedBox(
        height: 20.h,
      ),
    ];
  }

  List<Widget> completed() {
    return [
      Text(
        'Чек:',
        style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
      ),
      SizedBox(
        height: 5.h,
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 3.h),
        height: 115.h,
        color: MyColors.appBarLight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Итого:',
                    style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
                  ),
                ),
                Text(
                  '1 000 000 сумм',
                  style: TextStyle(fontSize: 14.sp, color: MyColors.blackText, fontFamily: "sf"),
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Скидка:0%',
                    style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
                  ),
                ),
                Text(
                  '0 сумм',
                  style: TextStyle(fontSize: 14.sp, color: MyColors.blackText, fontFamily: "sf"),
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Предоплата:',
                    style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
                  ),
                ),
                Text(
                  '0 сумм',
                  style: TextStyle(fontSize: 14.sp, color: MyColors.blackText, fontFamily: "sf"),
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'К оплате:',
                    style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
                  ),
                ),
                Text(
                  '1 000 000 сумм',
                  style: TextStyle(fontSize: 14.sp, color: MyColors.blackText, fontFamily: "sf"),
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      Text(
        'Тип оплаты:',
        style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
      ),
      SizedBox(
        height: 5.h,
      ),
      ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 3.h),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              height: 40.h,
              color: MyColors.appBarLight,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'RAHMAT',
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: index == 0 ? MyColors.blackText : MyColors.notActiveTextLight,
                      fontFamily: "sf"),
                ),
              ),
            );
          }),
      SizedBox(
        height: 15.h,
      ),
      CommonButtonWidget(
        onTaps: () {},
        colorOfButton: MyColors.activeTextLight,
        title: "Закрыть стол",
      ),
      SizedBox(
        height: 20.h,
      ),
    ];
  }
}
