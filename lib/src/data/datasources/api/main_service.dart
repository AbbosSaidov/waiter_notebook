import 'dart:convert';

import '../../../core/keys.dart';
import '../../../core/network/api.dart';
import '../../models/category_response_model.dart';
import '../../models/hall_response_model.dart';
import '../../models/menu_response_model.dart';
import '../../models/order_list_model.dart';
import '../../models/table_response_model.dart';

class MainService {
  Future<List<CategoryResponseModel>?> getCategory() async {
    final response = await Api.get("${Keys.baseUrl}/Category/Get");
    print("response=" + response.body);
    if (response.isSuccess) {
      try {
        return categoryResponseModelFromJson(response.body);
      } catch (_, e) {
        print("getCategory=$_==$e");
        return null;
      }
    } else {
      return null;
    }
  }

  Future<List<MenuResponseModel>?> getMenu() async {
    final response = await Api.get("${Keys.baseUrl}/Menu/Get");
    print(response.body);
    if (response.isSuccess) {
      try {
        return menuResponseModelFromJson(response.body);
      } catch (_, e) {
        print("getMenu=$_==$e");
        return null;
      }
    } else {
      return null;
    }
  }

  Future<List<TableResponseModel>?> getTable() async {
    final response = await Api.get("${Keys.baseUrl}/Table/Get");
    print(response.body);
    if (response.isSuccess) {
      try {
        return tableResponseModelFromJson(response.body);
      } catch (_, e) {
        print("getTable=$_==$e");
        return null;
      }
    } else {
      return null;
    }
  }

  Future<Map?> orderCreate(table, guestCount) async {
    var data = jsonEncode(
        {"table": table, "guestCount": guestCount, "persistentComment": "string", "nonPersistentComment": "string"});
    final response = await Api.post("${Keys.baseUrl}/Order/CreateHeader", data, notIncludeContent: true);
    print(response.body);
    if (response.isSuccess) {
      try {
        final Map recordsJson = json.decode(response.body);
        return recordsJson;
      } catch (_, e) {
        print("getTable=$_==$e");
        return null;
      }
    } else {
      return null;
    }
  }

  Future orderAddDish(data) async {
    print("tt2=" + data + "${Keys.orderId}");
    final response = await Api.post("${Keys.baseUrl}/Order/AddDish/${Keys.orderId}", data, notIncludeContent: true);

    if (response.isSuccess) {
      try {
        print("Success");
        return true;
      } catch (_, e) {
        print("orderAddDish=$_==$e");
        return null;
      }
    } else {
      return null;
    }
  }

  Future<bool> authCheck(code) async {
    final response = await Api.get("${Keys.baseUrl}/auth?code=$code");

    if (response.isSuccess) {
      try {
        print("Success=" + response.body.toString());
        return response.body.toString() == "true";
      } catch (_, e) {
        print("authCheck=$_==$e");
        return false;
      }
    } else {
      return false;
    }
  }

  Future<List<OrderListModel>?> orderList() async {
    final response = await Api.get("${Keys.baseUrl}/Order/List");

    if (response.isSuccess) {
      try {
        print("Success=" + response.body.toString());
        return orderListModelFromJson(response.body);
      } catch (_, e) {
        print("authCheck=$_==$e");
        return null;
      }
    } else {
      return null;
    }
  }

  Future<List<HallResponseModel>?> getHall() async {
    final response = await Api.get("${Keys.baseUrl}/HallPlan/Get");
    print(response.body);
    if (response.isSuccess) {
      try {
        return hallResponseModelFromJson(response.body);
      } catch (_, e) {
        print("getTable=$_==$e");
        return null;
      }
    } else {
      return null;
    }
  }
}
