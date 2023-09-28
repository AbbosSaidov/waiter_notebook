// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

List<OrderListModel> orderListModelFromJson(String str) => List<OrderListModel>.from(json.decode(str).map((x) => OrderListModel.fromJson(x)));

String orderListModelToJson(List<OrderListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderListModel {
  String orderId;
  List<Dish> dishs;
  int table;
  String persistentComment;
  String nonPersistentComment;
  int status;
  int orderSum;

  OrderListModel({
    required this.orderId,
    required this.dishs,
    required this.table,
    required this.persistentComment,
    required this.nonPersistentComment,
    required this.status,
    required this.orderSum,
  });

  OrderListModel copyWith({
    String? orderId,
    List<Dish>? dishs,
    int? table,
    String? persistentComment,
    String? nonPersistentComment,
    int? status,
    int? orderSum,
  }) =>
      OrderListModel(
        orderId: orderId ?? this.orderId,
        dishs: dishs ?? this.dishs,
        table: table ?? this.table,
        persistentComment: persistentComment ?? this.persistentComment,
        nonPersistentComment: nonPersistentComment ?? this.nonPersistentComment,
        status: status ?? this.status,
        orderSum: orderSum ?? this.orderSum,
      );

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
    orderId: json["orderId"],
    dishs: List<Dish>.from(json["dishs"].map((x) => Dish.fromJson(x))),
    table: json["table"],
    persistentComment: json["persistentComment"],
    nonPersistentComment: json["nonPersistentComment"],
    status: json["status"],
    orderSum: json["orderSum"],
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "dishs": List<dynamic>.from(dishs.map((x) => x.toJson())),
    "table": table,
    "persistentComment": persistentComment,
    "nonPersistentComment": nonPersistentComment,
    "status": status,
    "orderSum": orderSum,
  };
  String get priceFormatted {
    final format = NumberFormat('#,##0', 'en_US');
    return " " + format.format(orderSum).replaceAll(",", " ");
  }
}

class Dish {
  int id;
  int price;
  int quantity;
  String name;

  Dish({
    required this.id,
    required this.price,
    required this.quantity,
    required this.name,
  });

  Dish copyWith({
    int? id,
    int? price,
    int? quantity,
    String? name,
  }) =>
      Dish(
        id: id ?? this.id,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        name: name ?? this.name,
      );

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
    id: json["id"],
    price: json["price"],
    quantity: json["quantity"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "quantity": quantity,
    "name": name,
  };


}
