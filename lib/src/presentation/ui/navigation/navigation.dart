import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress_project/src/presentation/ui/select_table/select_table_page.dart';

import '../../utils/Colors.dart';
import '../../widgets/custom_bottomNavigation.dart';
import '../orders/orders_page.dart';
import '../profile/profile_page.dart';
import 'cubit/navigation_cubit.dart';
import 'cubit/navigation_state.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit()..fetch(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, activeTab) {
          var cubit = context.read<NavigationCubit>();
          return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300), child: getStageView(activeTab.stage, activeTab, cubit));
        },
      ),
    );
  }

  Widget getStageView(NavigationStage stage, activeTab, cubit) {
    switch (stage) {
      case NavigationStage.LOADING:
        return Center(
            child: CircularProgressIndicator(
          color: MyColors.activeTextLight,
        ));
      case NavigationStage.LOADED:
        return Scaffold(
          backgroundColor: MyColors.backgroundLight,
          // Body content changes based on the active tab
          body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: getBody(activeTab.tabs)),

          // Bottom Navigation Bar
          bottomNavigationBar: CustomBottomNavigationWidget(
            stateOFBottom: activeTab.tabs.index,
            onTap1: () => cubit.goToTable(),
            onTap2: () => cubit.goToOrders(),
            onTap3: () => cubit.goToProfile(),
          ),
        );
    }
  }

  Widget getBody(NavigationTabs activeTab) {
    switch (activeTab) {
      case NavigationTabs.TABLE:
        return const SelectTablePage();
      case NavigationTabs.ORDERS:
        return const OrdersPage();
      case NavigationTabs.PROFILE:
        return const ProfilePage();
      default:
        return const SelectTablePage();
    }
  }
}
