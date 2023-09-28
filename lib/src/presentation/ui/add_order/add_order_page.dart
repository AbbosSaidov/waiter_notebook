import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waitress_project/src/presentation/ui/add_order/cubit/add_order_cubit.dart';
import 'package:waitress_project/src/presentation/ui/add_order/cubit/add_order_state.dart';
import 'package:waitress_project/src/presentation/utils/Colors.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../widgets/common_button.dart';
import '../../widgets/custom_appbar.dart';
import '../navigation/cubit/navigation_cubit.dart';

class AddOrderPage extends StatefulWidget {
  const AddOrderPage({Key? key}) : super(key: key);

  @override
  _AddOrderPageState createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  bool isKeyboardOopened2 = false;
  late StreamSubscription<bool> keyboardSubscription;
  @override
  void initState() {
    super.initState();
    keyboardVisibility();
  }

  @override
  void dispose() {
    // Detach the listener when the widget is disposed to avoid memory leaks
    keyboardSubscription.cancel();
    super.dispose();
  }

  void keyboardVisibility() {
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) async {
      isKeyboardOopened2 = visible;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var navigationCubit = context.read<NavigationCubit>();
    var cubit;
    return SafeArea(
      child: BlocProvider(
        create: (_) => AddOrderCubit(),
        child: Scaffold(
          backgroundColor: MyColors.backgroundLight,
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBar(
            withBack: true,
            onTapBack: () {
              cubit.changeStage(context);
            },
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
                            'Активный',
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
                BlocBuilder<AddOrderCubit, AddOrderState>(
                    buildWhen: (previousState, currentState) => previousState.stateOfStage != currentState.stateOfStage,
                    builder: (context, state) {
                      cubit=context.read<AddOrderCubit>();
                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          if (state.stateOfStage == 0) ...menu(navigationCubit, context.read<AddOrderCubit>()),
                          if (state.stateOfStage == 1) ...menuItem(navigationCubit, context.read<AddOrderCubit>()),
                          if (state.stateOfStage == 2) ...addingItem(context.read<AddOrderCubit>()),
                          if (state.stateOfStage == 3) ...savingItem(context.read<AddOrderCubit>()),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> menu(NavigationCubit navigationCubit, AddOrderCubit cubit) {
    return [
      SizedBox(
        height: 22.w,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Меню",
            style: TextStyle(
              fontSize: 18.sp,
              color: MyColors.blackText,
              fontFamily: "sfBold",
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10.w,
      ),
      GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: (11 / 11),
        children: List.generate(navigationCubit.state.categories?.length ?? 0, (index) {
          return InkWell(
            onTap: () {
              cubit.changeStageAnCategory(1, navigationCubit.state.categories?[index].ident ?? 0, navigationCubit);
              print('Button ${index + 1} clicked');
            },
            borderRadius: BorderRadius.circular(5.r),
            child: Container(
              margin: EdgeInsets.all(2.w),
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: MyColors.listLight,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: Text(
                  navigationCubit.state.categories?[index].shortedName("ru").toString() ?? "",
                  style: TextStyle(
                    color: MyColors.blackText,
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }),
      )
    ];
  }

  List<Widget> menuItem(NavigationCubit navigationCubit, AddOrderCubit cubit) {
    return [
      SizedBox(
        height: 22.w,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Горячее",
            style: TextStyle(
              fontSize: 18.sp,
              color: MyColors.blackText,
              fontFamily: "sfBold",
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10.w,
      ),
      GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: (11 / 11),
        children: List.generate(cubit.state.menus?.length ?? 0, (index) {
          return InkWell(
            onTap: () {
              cubit.selectMenu(cubit.state.menus?[index]);
            },
            borderRadius: BorderRadius.circular(5.r),
            child: Container(
              margin: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: MyColors.listLight,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cubit.state.menus?[index].shortedName("ru").toString() ?? "",
                    style: TextStyle(
                      color: MyColors.blackText,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    cubit.state.menus?[index].priceFormatted ?? "",
                    style: TextStyle(
                      color: MyColors.notActiveTextLight,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      )
    ];
  }

  List<Widget> addingItem(AddOrderCubit cubit) {
    return [
      SizedBox(
        height: 22.w,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            cubit.state.currentProduct?.shortedName("ru")??"",
            style: TextStyle(
              fontSize: 18.sp,
              color: MyColors.blackText,
              fontFamily: "sfBold",
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10.w,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Размер:',
            style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
          ),
          SizedBox(
            height: 5.w,
          ),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: (11 / 11),
            children: List.generate(3, (index) {
              return InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(5.r),
                child: Container(
                  margin: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: MyColors.listLight,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Горячее $index',
                        style: TextStyle(
                          color: MyColors.blackText,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        '10$index 000 сум',
                        style: TextStyle(
                          color: MyColors.notActiveTextLight,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
      SizedBox(
        height: 10.w,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Свойства:',
            style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
          ),
          SizedBox(
            height: 5.w,
          ),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: (11 / 11),
            children: List.generate(3, (index) {
              return InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(5.r),
                child: Container(
                  margin: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: MyColors.listLight,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Горячее $index',
                        style: TextStyle(
                          color: MyColors.blackText,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        '10$index 000 сум',
                        style: TextStyle(
                          color: MyColors.notActiveTextLight,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
      SizedBox(
        height: 10.w,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Количество:',
            style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
          ),
          SizedBox(
            height: 5.w,
          ),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: (11 / 11),
            children: List.generate(3, (index) {
              return InkWell(
                onTap: () {
                  if (index != 1) {
                    if (index == 0) {
                      cubit.changeNumber(-1);
                    } else {
                      cubit.changeNumber(1);
                    }
                  }
                },
                borderRadius: BorderRadius.circular(5.r),
                child: Container(
                  margin: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color:index != 1? MyColors.listLight:MyColors.activePersons,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: BlocBuilder<AddOrderCubit, AddOrderState>(
                      buildWhen: (previousState, currentState) =>
                          previousState.currentCount != currentState.currentCount,
                      builder: (context, state) {
                        String text = index == 1 ? state.currentCount.toString() : (index == 0 ? "-" : "+");
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              text,
                              style: TextStyle(
                                color:index != 1 ?MyColors.blackText:MyColors.whiteText,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              index == 1 ? (state.currentProduct?.priceFormatted ??"")+" сум": "",
                              style: TextStyle(
                                color: index != 1 ?MyColors.blackText:MyColors.whiteText,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              );
            }),
          ),
        ],
      ),
      SizedBox(
        height: 10.w,
      ),
      Text(
        'Коментарий к блюду:',
        style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
      ),
      SizedBox(
        height: 10.w,
      ),
      TextField(
        style: TextStyle(color: MyColors.whiteText),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: BorderSide(color: MyColors.listLight, width: 2.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(color: MyColors.listLight, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(color: MyColors.listLight, width: 2.0),
          ),
          hintStyle: TextStyle(color: MyColors.notActiveTextLight, fontSize: 14.sp),
          hintText: 'Без коментария.',
        ),
      ),
      SizedBox(
        height: 10.w,
      ),
      BlocBuilder<AddOrderCubit, AddOrderState>(
          buildWhen: (previousState, currentState) => previousState.currentCount != currentState.currentCount,
          builder: (context, state) {
            return CommonButtonWidget(
              onTaps: () {
                if (state.currentCount != 0) {
                  cubit.addDish();
                }
              },
              colorOfButton: MyColors.activeTextLight,
              title: "Добавить",
            );
          }),
      SizedBox(
        height: 20.h + (isKeyboardOopened2 ? 250.h : 0),
      ),
    ];
  }

  List<Widget> savingItem(AddOrderCubit cubit) {
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
              style: TextStyle(fontSize: 17.sp, color: MyColors.blackText, fontFamily: "sf"),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Количество:',
              style: TextStyle(fontSize: 17.sp, color: MyColors.blackText, fontFamily: "sf"),
            ),
          ),
          const Icon(
            Icons.share,
            color: Colors.transparent,
          ),
        ],
      ),
      SizedBox(
        height: 5.w,
      ),
      BlocBuilder<AddOrderCubit, AddOrderState>(
          buildWhen: (previousState, currentState) => previousState.orders != currentState.orders,
          builder: (context, state) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.orders?.length ?? 0,
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
                          state.orders?[index].shortedName("ru").toString() ?? "" + ":",
                          style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'x' + (state.orders?[index].count.toString() ?? ""),
                          style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
                        ),
                      ),
                      Icon(
                        Icons.share,
                        color: MyColors.notActiveTextLight,
                      ),
                    ],
                  ),
                );
              },
            );
          }),
      SizedBox(
        height: 10.w,
      ),
      SizedBox(
        height: 200.w,
      ),
      CommonButtonWidget(
        onTaps: () {
          cubit.backToMenu();
        },
        colorOfButton: MyColors.notActiveTextLight,
        title: "Добавить блюдо",
      ),
      SizedBox(
        height: 10.w,
      ),
      CommonButtonWidget(
        onTaps: () {
          cubit.saveDish(context);
        },
        colorOfButton: MyColors.activeTextLight,
        title: "Сохранить",
      ),
      SizedBox(
        height: 20.h,
      ),
    ];
  }
}
