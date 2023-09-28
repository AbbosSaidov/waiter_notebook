import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/menu_response_model.dart';

part 'add_order_state.freezed.dart';

@freezed
class AddOrderState with _$AddOrderState {
  const factory AddOrderState({
    @Default(0) int stateOfStage,
    List<MenuResponseModel>? menus,
    @Default([]) List<MenuResponseModel>? orders,
    @Default(0) int? currentCount,
    MenuResponseModel? currentProduct,
}) = _AddOrderState;
}