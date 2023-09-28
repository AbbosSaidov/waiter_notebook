// To parse this JSON data, do
//
//     final categoryResponseModel = categoryResponseModelFromJson(jsonString);

import 'dart:convert';


List<CategoryResponseModel> categoryResponseModelFromJson(String str) => List<CategoryResponseModel>.from(json.decode(str).map((x) => CategoryResponseModel.fromJson(x)));

String categoryResponseModelToJson(List<CategoryResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryResponseModel {
  int ident;
  String? nameRu;
  String? nameUz;
  String? nameEn;
  String? img;
  int mainParentIdent;

  CategoryResponseModel({
    required this.ident,
    required this.nameRu,
    required this.nameUz,
    required this.nameEn,
    required this.img,
    required this.mainParentIdent,
  });

  CategoryResponseModel copyWith({
    int? ident,
    String? nameRu,
    String? nameUz,
    String? nameEn,
    String? img,
    int? mainParentIdent,
  }) =>
      CategoryResponseModel(
        ident: ident ?? this.ident,
        nameRu: nameRu ?? this.nameRu,
        nameUz: nameUz ?? this.nameUz,
        img: img ?? this.img,
        nameEn: nameEn ?? this.nameEn,
        mainParentIdent: mainParentIdent ?? this.mainParentIdent,
      );

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => CategoryResponseModel(
    ident: json["ident"],
    nameRu: json["nameRu"],
    nameUz: json["nameUz"],
    nameEn: json["nameEn"],
    img: json["img"],
    mainParentIdent: json["mainParentIdent"],
  );

  Map<String, dynamic> toJson() => {
    "ident": ident,
    "nameRu":nameRu,
    "nameUz":nameUz,
    "nameEn":nameEn,
    "img":img,
    "mainParentIdent": mainParentIdent,
  };
  String? shortedName(String language) {
    String name = "";
    if (language == "ru") {
      name = nameRu ?? "";
    } else if (language == "uz") {
      name = nameUz ?? "";
    } else if (language == "en") {
      name = nameEn ?? "";
    }
    if (name.length > 20) {
      return name.substring(0, 15);
    }
    return name;
  }


}