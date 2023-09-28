import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waitress_project/src/presentation/ui/add_order/add_order_page.dart';
import 'package:waitress_project/src/presentation/ui/table/cubit/person_state.dart';
import 'package:waitress_project/src/presentation/utils/Colors.dart';

import '../../widgets/common_button.dart';
import '../../widgets/custom_appbar.dart';
import '../navigation/cubit/navigation_cubit.dart';
import 'cubit/person_cubit.dart';

class TablePage extends StatelessWidget {
  const TablePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var navigationCubit = context.read<NavigationCubit>();
    return SafeArea(
      child: BlocProvider(
        create: (_) => PersonCubit(),
        child: Scaffold(
          backgroundColor: MyColors.backgroundLight,
          appBar: const CustomAppBar(
            withBack: true,
            title: "Стол №7",
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: BlocBuilder<PersonCubit, PersonState>(
                buildWhen: (previousState, currentState) => previousState.stage != currentState.stage,
                builder: (context, state) {
                  return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: getStageView(state, navigationCubit, context,context.read<PersonCubit>()));
                }),
          ),
        ),
      ),
    );
  }

  Widget getStageView(PersonState state, navigationCubit, context,personCubit) {
    if (state.stage == PersonStage.LOADING) {
      return Center(
        child: CircularProgressIndicator(
          color: MyColors.activeTextLight,
        ),
      );
    } else {
      return pickPersonNumberView(navigationCubit, context, state.numberOfPersons,personCubit);
    }
  }

  Widget pickPersonNumberView(NavigationCubit navigationCubit, context,numberOfPersons,personCubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.w,
        ),
        Text(
          'Зал:',
          style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
        ),
        SizedBox(
          height: 5.w,
        ),
        Text(
          'Ovqat xonasi',
          style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
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
                    'Стол:',
                    style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    '№7',
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
                    'Количество персон:',
                    style: TextStyle(fontSize: 17.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  BlocBuilder<PersonCubit, PersonState>(
                      buildWhen: (previousState, currentState) =>
                          previousState.numberOfPersons != currentState.numberOfPersons,
                      builder: (context, state) {
                        return Text(
                          (state.numberOfPersons + 1).toString(),
                          style: TextStyle(fontSize: 15.sp, color: MyColors.blackText, fontFamily: "sf"),
                        );
                      }),
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
        BlocBuilder<PersonCubit, PersonState>(
            buildWhen: (previousState, currentState) => previousState.numberOfPersons != currentState.numberOfPersons,
            builder: (context, state) {
              return GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 5,
                childAspectRatio: (62 / 35),
                children: List.generate(15, (index) {
                  return InkWell(
                    onTap: () {
                      context.read<PersonCubit>().changeNumbers(index);
                      print('Button ${index + 1} clicked');
                    },
                    borderRadius: BorderRadius.circular(5.r),
                    child: Container(
                      margin: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        color: state.numberOfPersons == index ? MyColors.activePersons : MyColors.listLight,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color:state.numberOfPersons != index ? MyColors.blackText:MyColors.whiteText,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            }),
        const Spacer(),
        CommonButtonWidget(
          onTaps: () {

            personCubit.createOrderHeader(context,navigationCubit);
            // Navigator.of(context).push(AnimateRoute.createRoute(const AddOrderPage()));
          },
          colorOfButton: MyColors.activeTextLight,
          title: "Добавить заказ",
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
