import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repositories/repository_main.dart';
import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());
  final repo = RepositoryMain();
  void goToTable() => emit(state.copyWith(tabs: NavigationTabs.TABLE));
  void goToOrders() => emit(state.copyWith(tabs: NavigationTabs.ORDERS));
  void goToProfile() => emit(state.copyWith(tabs: NavigationTabs.PROFILE));

  Future<void> fetch() async {
    emit(state.copyWith(stage: NavigationStage.LOADING));
    print("1");
    var categories = (await repo.getCategory()) ?? [];  print("2");
    var menuItems = (await repo.getMenu()) ?? [];  print("3");
    var tables = (await repo.getTable()) ?? [];  print("4");
    var halls = (await repo.getHall()) ?? [];  print("5");

    // Iterate through each table to associate it with the correct hall
    for (var table in tables) {
      // Iterate through each hall to find a match for the table's hall
      for (var hall in halls) {
        // Check if the table belongs to this hall
        if (table.hall.toString() == hall.ident.toString()) {
          // Add the table to this hall's list of tables
          hall.tables?.add(table);
          break;  // Break the inner loop as we've found the hall for this table
        }
      }
    }

    emit(state.copyWith(
        stage: NavigationStage.LOADED, categories: categories, menus: menuItems, tables: tables, halls: halls));
  }
}
