// To parse this JSON data, do
//
//     final hallResponseModel = hallResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:waitress_project/src/data/models/table_response_model.dart';

List<HallResponseModel> hallResponseModelFromJson(String str) => List<HallResponseModel>.from(json.decode(str).map((x) => HallResponseModel.fromJson(x)));

String hallResponseModelToJson(List<HallResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HallResponseModel {
  int ident;
  String name;
  List<TableResponseModel>? tables;
  HallResponseModel({
    required this.ident,
    required this.name,
    this.tables,
  });

  HallResponseModel copyWith({
    int? ident,
    String? name,
    List<TableResponseModel>? tables,
  }) =>
      HallResponseModel(
        ident: ident ?? this.ident,
        name: name ?? this.name,
        tables: tables ?? this.tables,
      );

  factory HallResponseModel.fromJson(Map<String, dynamic> json) => HallResponseModel(
    ident: json["ident"],
    name: json["name"],
    tables: [],
  );

  Map<String, dynamic> toJson() => {
    "ident": ident,
    "name": name,
    "tables": tables,
  };
}
