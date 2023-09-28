import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waitress_project/src/data/models/hall_response_model.dart';
import 'package:waitress_project/src/data/models/table_response_model.dart';

import '../../../../data/models/category_response_model.dart';
import '../../../../data/models/menu_response_model.dart';

part 'navigation_state.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState({
    @Default(NavigationStage.LOADING) NavigationStage stage,
    @Default(NavigationTabs.TABLE) NavigationTabs tabs,
    List<CategoryResponseModel>? categories,
    List<MenuResponseModel>? menus,
    List<TableResponseModel>? tables,
    List<HallResponseModel>? halls,
  }) = _NavigationState;
}

enum NavigationStage { LOADING, LOADED }

enum NavigationTabs { TABLE, ORDERS, PROFILE }
