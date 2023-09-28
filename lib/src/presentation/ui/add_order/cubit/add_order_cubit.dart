import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress_project/src/presentation/ui/navigation/cubit/navigation_cubit.dart';

import '../../../../data/models/menu_response_model.dart';
import '../../../../domain/repositories/repository_main.dart';
import 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit() : super(const AddOrderState());
  final repo = RepositoryMain();

  Future<void> changeStageAnCategory(int stage, int categoryId, NavigationCubit navigationCubit) async {
    List<MenuResponseModel>? menus = [];
    for (int i = 0; i < (navigationCubit.state.menus?.length ?? 0); i++) {
      if (categoryId == navigationCubit.state.menus?[i].categoryId) {
        menus.add(navigationCubit.state.menus![i]);
      }
    }
    emit(state.copyWith(stateOfStage: stage, menus: menus));
  }

  Future<void> changeStage(context) async {
    if (state.stateOfStage == 0) {
      Navigator.pop(context);
    } else {
      emit(state.copyWith(stateOfStage: state.stateOfStage - 1));
    }
  }

  Future<void> changeNumber(int number) async {
    // Make sure the state and currentCount are initialized
    if (state.currentCount == null) {
      return;
    }

    // If the current count is 0, only allow positive increments
    if (state.currentCount == 0 && number < 0) {
      return;
    }

    // Update the current count
    int newCount = state.currentCount! + number;
    emit(state.copyWith(currentCount: newCount));
  }

  Future<void> selectMenu(MenuResponseModel? idProduct) async {
    emit(state.copyWith(stateOfStage: 2, currentProduct: idProduct));
  }

  Future<void> addDish() async {
    List<MenuResponseModel>? orders = [];
    for (int i = 0; i < (state.menus?.length ?? 0); i++) {
      if (state.menus?[i].ident == state.currentProduct?.ident) {
        orders.add(state.menus![i].copyWith(count: state.currentCount));
        break;
      }
    }

    orders.addAll(state.orders as Iterable<MenuResponseModel>);
    emit(state.copyWith(orders: orders, stateOfStage: 3));
  }

  Future<void> saveDish(context) async {
    var dataItems = [];
    for (int i = 0; i < (state.orders?.length ?? 0); i++) {
      var item = {
        "id": state.orders?[i].ident,
        "price": state.orders![i].price,
        "quantity": state.orders?[i].count,
        "isCombo": state.orders?[i].isCombo,
        "modifiers": state.orders?[i].modis
            .map((e) {
              if (e.count > 0) {
                return {
                  "id": e.ident,
                  "count": e.count,
                  "price": e.price,
                };
              }
            })
            .where((element) => element != null)
            .toList(),
      };
      dataItems.add(item);
    }
    var response = (await repo.orderAddDish(jsonEncode(dataItems)));
    Navigator.pop(context);
  }

  Future<void> backToMenu() async {
    emit(state.copyWith(stateOfStage: 0, currentCount: 0));
  }
}
