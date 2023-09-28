import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/order_list_model.dart';
import '../../../../domain/repositories/repository_main.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(const OrdersState());
  final repo = RepositoryMain();
  Future<void> fetch() async {
    var orders = (await repo.orderList()) ?? [];
  //  List<OrderListModel> BUSYOrders = (orders ?? []).where((order) => order.status == 1).toList();
  //  List<OrderListModel> BILLOrders = (orders ?? []).where((order) => order.status == 2).toList();
  //  List<OrderListModel> FREEOrders = (orders ?? []).where((order) => order.status == 0).toList();

    emit(state.copyWith(
        stage: OrdersStage.LOADED,
        filteredOrders: orders,
        orderList: orders,
        BILLOrders: orders,
        BUSYOrders: orders,
        FREEOrders: orders));
  }

  Future<void> changeType(OrdersType type) async {
    List<OrderListModel> statusFilteredOrders;
    switch (type) {
      case OrdersType.FREE:
        statusFilteredOrders = state.FREEOrders ?? [];
        break;
      case OrdersType.BILL:
        statusFilteredOrders = state.BILLOrders ?? [];
        break;
      case OrdersType.BUSY:
        statusFilteredOrders = state.BUSYOrders ?? [];
        break;
    }

    emit(state.copyWith(OrderType: type, filteredOrders: statusFilteredOrders));
  }
}
