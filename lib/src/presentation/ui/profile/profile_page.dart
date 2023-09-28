import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waitress_project/src/presentation/utils/Colors.dart';

import '../../widgets/common_button.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_bottomNavigation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColors.backgroundLight,
          appBar: const CustomAppBar(
            withBack: false,
            title: "Мой профиль",
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
                            'Имя:',
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
                            'Заведение:',
                            style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Text(
                            'Пельменная',
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
                            'Роль:',
                            style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Text(
                            'Официант ',
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
                            'Смена:',
                            style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Text(
                            'День',
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
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.listLight,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      focusColor: MyColors.notActiveTextLight,
                      unselectedWidgetColor: MyColors.notActiveTextLight,
                      colorScheme: ColorScheme.light(
                        primary: MyColors.notActiveTextLight,
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text('Мои чаевые',
                          style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf")),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              width: 101.w,
                              child: MaterialButton(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                height: 32.h,
                                color: MyColors.activeButtonLight,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: FittedBox(
                                    child: Text(
                                  'Сегодня',
                                  style: TextStyle(color: MyColors.blackText),
                                  maxLines: 1,
                                )),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(
                              width: 109.w,
                              child: MaterialButton(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                height: 32.h,
                                color: MyColors.notActiveButtonLight,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: FittedBox(
                                    child: Text(
                                  'Последние 7 дней',
                                  style: TextStyle(color: MyColors.notActiveTextLight),
                                  maxLines: 1,
                                )),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(
                              width: 101.w,
                              child: MaterialButton(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                height: 32.h,
                                color: MyColors.notActiveButtonLight,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: FittedBox(
                                  child: Text(
                                    'Все время',
                                    style: TextStyle(color: MyColors.notActiveTextLight),
                                    maxLines: 1,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(5.w),
                          height: 150.h,
                          child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: 26.h,
                                child: Row(
                                  children: [
                                    Text(
                                      '19:50 заказ №12349',
                                      style: TextStyle(color: MyColors.notActiveTextLight, fontSize: 14.sp),
                                      maxLines: 1,
                                    ),
                                    const Spacer(),
                                    Text(
                                      'RAHMAT',
                                      style: TextStyle(color: MyColors.blackText, fontSize: 14.sp),
                                      maxLines: 1,
                                    ),
                                    const Spacer(),
                                    Text(
                                      '50 000 сумм',
                                      style: TextStyle(color: MyColors.blackText, fontSize: 14.sp),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 1,
                                color: MyColors.divider,
                              );
                            },
                            itemCount: 13,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          height: 40.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Итого:',
                                  style: TextStyle(fontSize: 17.sp, color: MyColors.blackText, fontFamily: "sf")),
                              Text('250 000 сумм',
                                  style: TextStyle(fontSize: 17.sp, color: MyColors.blackText, fontFamily: "sf")),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.listLight, // Set your desired color here
                    borderRadius: BorderRadius.circular(10), // Set your desired border radius here
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      focusColor: MyColors.notActiveTextLight,
                      unselectedWidgetColor: MyColors.notActiveTextLight,
                      colorScheme: ColorScheme.light(
                        primary: MyColors.notActiveTextLight,
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text('Мои заказы',
                          style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf")),
                      children: <Widget>[
                        Container(
                          // height: 250.h,
                          padding: EdgeInsets.only(top: 5.h),
                          color: MyColors.backgroundLight,
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            childAspectRatio: (163.w / 135.h),
                            children: List.generate(5, (indexs) {
                              return Container(
                                margin: EdgeInsets.all(2.w),
                                padding: EdgeInsets.all(5.w),
                                decoration: BoxDecoration(
                                  color: MyColors.listLight,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 21.h,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(
                                              "Стол №7",
                                              style: TextStyle(color: MyColors.notActiveTextLight),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(
                                              "19:05",
                                              style: TextStyle(color: MyColors.blackText),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      color: MyColors.divider,
                                    ),
                                    SizedBox(
                                      height: 84.h,
                                      child: ListView.builder(
                                          itemCount: indexs + 1,
                                          itemBuilder: (BuildContext context, int index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: Text(
                                                "x6 Пельмени",
                                                style: TextStyle(color: MyColors.blackText),
                                              ),
                                            );
                                          }),
                                    ),
                                    Container(
                                      height: 1,
                                      color: MyColors.divider,
                                    ),
                                    SizedBox(
                                      height: 21.h,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: Icon(
                                                  Icons.person,
                                                  color: MyColors.notActiveTextLight,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: Text(
                                                  "6",
                                                  style: TextStyle(color: MyColors.blackText),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.cases_outlined,
                                                color: MyColors.notActiveTextLight,
                                                size: 14.h,
                                              ),
                                              Text(
                                                " 1 000 000",
                                                style: TextStyle(color: MyColors.blackText, fontSize: 13.sp),
                                              ),
                                              Text(
                                                " сум",
                                                style: TextStyle(color: MyColors.notActiveTextLight, fontSize: 12.sp),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.listLight, // Set your desired color here
                    borderRadius: BorderRadius.circular(10), // Set your desired border radius here
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      focusColor: MyColors.notActiveTextLight,
                      unselectedWidgetColor: MyColors.notActiveTextLight,
                      colorScheme: ColorScheme.light(
                        primary: MyColors.notActiveTextLight,
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text('Моя смена',
                          style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf")),
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 40.h,
                          child: Row(
                            children: [
                              Text(
                                'День    10:00-18:00',
                                style: TextStyle(color: MyColors.blackText, fontSize: 14.sp),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          color: MyColors.divider,
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        CommonButtonWidget(
                          onTaps: () {},
                          colorOfButton: MyColors.notActiveTextLight,
                          title: "Закрыть смену",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),),
    );
  }
}
