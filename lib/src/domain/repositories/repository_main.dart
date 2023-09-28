import 'package:waitress_project/src/data/models/table_response_model.dart';

import '../../data/datasources/api/main_service.dart';
import '../../data/models/category_response_model.dart';
import '../../data/models/hall_response_model.dart';
import '../../data/models/menu_response_model.dart';
import '../../data/models/order_list_model.dart';

class RepositoryMain {
  final _service = MainService();

  Future<List<CategoryResponseModel>?> getCategory() => _service.getCategory();
  Future<List<MenuResponseModel>?> getMenu() => _service.getMenu();
  Future<List<TableResponseModel>?> getTable() => _service.getTable();
  Future<List<HallResponseModel>?> getHall() => _service.getHall();
  Future<Map?> orderCreate(table, guestCount) => _service.orderCreate(table, guestCount);
  Future orderAddDish(data) => _service.orderAddDish(data);
  Future<bool> authCheck(code) => _service.authCheck(code);
  Future<List<OrderListModel>?> orderList() => _service.orderList();
}
