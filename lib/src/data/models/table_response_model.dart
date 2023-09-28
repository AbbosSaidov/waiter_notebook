// To parse this JSON data, do
//
//     final tableResponseModel = tableResponseModelFromJson(jsonString);

import 'dart:convert';

List<TableResponseModel> tableResponseModelFromJson(String str) => List<TableResponseModel>.from(json.decode(str).map((x) => TableResponseModel.fromJson(x)));

String tableResponseModelToJson(List<TableResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TableResponseModel {
  int ident;
  String name;
  int hall;
  bool myTable;
  TableStatus status;


  TableResponseModel({
    required this.ident,
    required this.name,
    required this.hall,
    required this.myTable,
    required this.status,
  });

  TableResponseModel copyWith({
    int? ident,
    String? name,
    int? hall,
    bool? myTable,
    TableStatus? status,
  }) =>
      TableResponseModel(
        ident: ident ?? this.ident,
        name: name ?? this.name,
        myTable: myTable ?? this.myTable,
        hall: hall ?? this.hall,
        status: status ?? this.status,
      );

  factory TableResponseModel.fromJson(Map<String, dynamic> json) => TableResponseModel(
    ident: json["ident"],
    name: json["name"],
    hall: json["hall"],
    myTable: json["myTable"],
    status: TableStatus.values[json["status"]],
  );

  Map<String, dynamic> toJson() => {
    "ident": ident,
    "name": name,
    "hall": hall,
    "myTable": myTable,
    "status": status.index,
  };
}
enum TableStatus { Free, Busy, Bill }