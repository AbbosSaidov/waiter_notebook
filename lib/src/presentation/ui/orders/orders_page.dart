import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waitress_project/src/presentation/ui/orders/cubit/orders_cubit.dart';
import 'package:waitress_project/src/presentation/utils/Colors.dart';

import '../../utils/route_animat.dart';
import '../../widgets/custom_appbar.dart';
import '../close_table/close_table_page.dart';
import 'cubit/orders_state.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backgroundLight,
        appBar: const CustomAppBar(
          withBack: false,
          title: "Заказы",
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: BlocProvider(
            create: (_) => OrdersCubit()..fetch(),
            child: BlocBuilder<OrdersCubit, OrdersState>(
              buildWhen: (previousState, currentState) => previousState.stage != currentState.stage,
              builder: (context, activeTab) {
                return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300), child: getStageView(activeTab.stage, context));
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget getStageView(OrdersStage stage, context) {
    switch (stage) {
      case OrdersStage.LOADING:
        return Center(
            child: CircularProgressIndicator(
          color: MyColors.activeTextLight,
        ));
      case OrdersStage.LOADED:
        return ListView(
          padding: EdgeInsets.only(bottom: 10.w),
          children: [
            SizedBox(
              height: 20.w,
            ),
            typeOfOrders(),
            ///s
            SizedBox(
              height: 15.w,
            ),
            Text(
              'Tamaki xonasi',
              style: TextStyle(fontSize: 14.sp, color: MyColors.notActiveTextLight, fontFamily: "sf"),
            ),
            SizedBox(
              height: 5.w,
            ),
            BlocBuilder<OrdersCubit, OrdersState>(
                buildWhen: (previousState, currentState) => previousState.filteredOrders != currentState.filteredOrders || previousState.OrderType != currentState.OrderType,
                builder: (context, state) {
                  return GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: (163.w / 135.h),
                    children: List.generate(state.filteredOrders?.length ?? 0, (indexs) {
                      return Container(
                        margin: EdgeInsets.all(2.w),
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(
                          color: MyColors.whiteText,
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
                                      "Стол №",
                                      style: TextStyle(color: MyColors.notActiveTextLight),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      "${state.filteredOrders?[indexs].table.toString()}",
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
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(AnimateRoute.createRoute(const CloseTablePage()));
                              },
                              child: SizedBox(
                                height: 84.h,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                    itemCount: state.filteredOrders?[indexs].dishs.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                          "x${state.filteredOrders?[indexs].dishs[index].quantity} ${state.filteredOrders?[indexs].dishs[index].name}",
                                          style: TextStyle(color: MyColors.blackText),
                                        ),
                                      );
                                    }),
                              ),
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
                                        "${state.filteredOrders?[indexs].priceFormatted}",
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
                  );
                }),
          ],
        );
    }
  }

  Widget typeOfOrders() {
    return BlocBuilder<OrdersCubit, OrdersState>(
        buildWhen: (previousState, currentState) => previousState.OrderType != currentState.OrderType,
        builder: (context, activeTab) {
        return Container(
          width: 331.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: MyColors.listLight,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 101.w,
                child: MaterialButton(
                  height: 32.h,
                  color:activeTab.OrderType==OrdersType.BUSY? MyColors.activeButtonLight:MyColors.notActiveButtonLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FittedBox(
                      child: Text(
                    'Активные ${activeTab.BUSYOrders?.length}',
                    style: TextStyle(color: MyColors.blackText),
                    maxLines: 1,
                  )),
                  onPressed: () {
                    context.read<OrdersCubit>().changeType(OrdersType.BUSY);
                  },
                ),
              ),
              SizedBox(
                width: 109.w,
                child: MaterialButton(
                  height: 32.h,
                  color:activeTab.OrderType==OrdersType.BILL? MyColors.activeButtonLight:MyColors.notActiveButtonLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FittedBox(
                      child: Text(
                    'В предчеке ${activeTab.BILLOrders?.length}',
                    style: TextStyle(color: MyColors.blackText),
                    maxLines: 1,
                  )),
                  onPressed: () {
                    context.read<OrdersCubit>().changeType(OrdersType.BILL);
                  },
                ),
              ),
              SizedBox(
                width: 101.w,
                child: MaterialButton(
                  height: 32.h,
                  color: activeTab.OrderType==OrdersType.FREE? MyColors.activeButtonLight:MyColors.notActiveButtonLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FittedBox(
                    child: Text(
                      'Выданны ${activeTab.FREEOrders?.length}',
                      style: TextStyle(color: MyColors.blackText),
                      maxLines: 1,
                    ),
                  ),
                  onPressed: () {
                    context.read<OrdersCubit>().changeType(OrdersType.FREE);
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
