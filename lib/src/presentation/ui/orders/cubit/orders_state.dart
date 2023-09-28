import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/order_list_model.dart';
part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState({
    @Default(OrdersStage.LOADING) OrdersStage stage,
    @Default(OrdersType.BUSY) OrdersType OrderType,
    List<OrderListModel>? orderList,
    List<OrderListModel>? filteredOrders,
    List<OrderListModel>? FREEOrders,
    List<OrderListModel>? BILLOrders,
    List<OrderListModel>? BUSYOrders,
  }) = _OrdersState;
}

enum OrdersStage { LOADING, LOADED }

enum OrdersType { FREE, BILL, BUSY }
