import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waitress_project/src/data/models/table_response_model.dart';
import 'package:waitress_project/src/presentation/ui/select_table/cubit/table_cubit.dart';
import 'package:waitress_project/src/presentation/ui/select_table/cubit/table_state.dart';
import 'package:waitress_project/src/presentation/utils/Colors.dart';

import '../../../core/keys.dart';
import '../../widgets/custom_appbar.dart';
import '../navigation/cubit/navigation_cubit.dart';
import '../table/table_page.dart';

class SelectTablePage extends StatelessWidget {
  const SelectTablePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navigationCubit = context.read<NavigationCubit>();
    return SafeArea(
      child: BlocProvider(
        create: (_) => TableCubit()..init(navigationCubit.state.halls??[]),
        child: Scaffold(
          backgroundColor: MyColors.backgroundLight,
          appBar: const CustomAppBar(
            withBack: false,
            title: "Выберите стол",
          ),
          body: BlocBuilder<TableCubit, TableState>(
              buildWhen: (previousState, currentState) => previousState.halls != currentState.halls,
            builder: (context,state) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ListView.builder(
                      itemCount: state.halls?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildSection(state.halls?[index].name ?? "",
                            state.halls?[index].tables?.length ?? 0, context, navigationCubit,index);
                      }));
            }
          ),
        ),
      ),
    );
  }

  Widget buildSection(String title, int itemCount, BuildContext context, navigationCubit,indexOfHall) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.w),
        buildTitleText(title),
        SizedBox(height: 5.w),
        buildGrid(itemCount, context, navigationCubit,indexOfHall),
      ],
    );
  }

  Widget buildTitleText(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        color: MyColors.notActiveTextLight,
        fontFamily: "sf",
      ),
    );
  }

  Widget buildGrid(int count, BuildContext context, navigationCubit,indexOfHall) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 5,
      childAspectRatio: (62 / 35),
      children: List.generate(count, (index) {
        return buildGridItem(index, context, navigationCubit, indexOfHall);
      }),
    );
  }

  Widget buildGridItem(int index, BuildContext context, NavigationCubit navigationCubit, int count) {
    Color background;
    Color textColor;
    var tableCubit = context.read<TableCubit>();
    if (tableCubit.state.halls![count].tables?[index].status == TableStatus.Busy) {
      background = MyColors.blueStatusLight;
      textColor = MyColors.whiteText;
    } else if (tableCubit.state.halls![count].tables?[index].status == TableStatus.Free) {
      background = MyColors.listLight;
      textColor = MyColors.blackText;
    } else if (tableCubit.state.halls![count].tables?[index].status == TableStatus.Bill) {
      background = MyColors.activeTextLight;
      textColor = MyColors.blackText;
    } else {
      // Default colors, in case the status is null or not recognized
      background = Colors.grey;
      textColor = MyColors.blackText;
    }
    return InkWell(
      onTap: () {
        Keys.tableId=tableCubit.state.halls![count].tables?[index].ident;
        print('Button ${index + 1} clicked');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BlocProvider.value(
                value: navigationCubit,
                child: const TablePage(),
              );
            },
          ),
        );
      },
      borderRadius: BorderRadius.circular(5.r),
      child: Container(
        margin: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Center(
          child: Text(
            '${index + 1}',
            style: TextStyle(
              color: textColor,
              fontSize: 16.sp,
              fontFamily: "sfBold",
            ),
          ),
        ),
      ),
    );
  }
}
