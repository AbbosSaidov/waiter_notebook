// To parse this JSON data, do
//
//     final menuResponseModel = menuResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';


List<MenuResponseModel> menuResponseModelFromJson(String str) =>
    List<MenuResponseModel>.from(json.decode(str).map((x) => MenuResponseModel.fromJson(x)));

String menuResponseModelToJson(List<MenuResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuResponseModel {
  int ident;
  int? count;
  String? nameRu;
  String? nameUz;
  String? nameEn;
  String? descriptionRu;
  String? descriptionUz;
  String? descriptionEn;
  String? imagePath;
  int categoryId;
  num price;
  bool isCombo;
  List<Modi> modis;
  List<Recommended>? recommended;

  MenuResponseModel({
    required this.ident,
    this.count,
    required this.nameRu,
    required this.nameUz,
    required this.nameEn,
    required this.descriptionRu,
    required this.descriptionUz,
    required this.descriptionEn,
    required this.imagePath,
    required this.categoryId,
    required this.price,
    required this.isCombo,
    required this.modis,
    required this.recommended,
  });

  MenuResponseModel copyWith({
    int? ident,
    int? count,
    String? nameRu,
    String? nameUz,
    String? nameEn,
    String? descriptionRu,
    String? descriptionUz,
    String? descriptionEn,
    String? imagePath,
    int? categoryId,
    num? price,
    bool? isCombo,
    List<Modi>? modis,
    List<Recommended>? recommended,
  }) =>
      MenuResponseModel(
        ident: ident ?? this.ident,
        count: count ?? this.count,
        nameRu: nameRu ?? this.nameRu,
        nameUz: nameUz ?? this.nameUz,
        nameEn: nameEn ?? this.nameEn,
        descriptionRu: descriptionRu ?? this.descriptionRu,
        descriptionUz: descriptionUz ?? this.descriptionUz,
        descriptionEn: descriptionEn ?? this.descriptionEn,
        imagePath: imagePath ?? this.imagePath,
        categoryId: categoryId ?? this.categoryId,
        price: price ?? this.price,
        isCombo: isCombo ?? this.isCombo,
        modis: modis ?? this.modis,
        recommended: recommended ?? this.recommended,
      );

  factory MenuResponseModel.fromJson(Map<String, dynamic> json) => MenuResponseModel(
        ident: json["ident"],
        nameRu: json["nameRu"],
        count: 0,
        nameUz: json["nameUz"],
        nameEn: json["nameEn"],
        descriptionRu: json["descriptionRu"],
        descriptionUz: json["descriptionUz"],
        descriptionEn: json["descriptionEn"],
        imagePath: json["imagePath"],
        categoryId: json["categoryId"],
        price: json["price"],
        isCombo: json["isCombo"],
        modis: List<Modi>.from(json["modis"].map((x) => Modi.fromJson(x))),
        recommended: List<Recommended>.from(json["recommended"].map((x) => Recommended.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ident": ident,
        "nameRu": nameRu,
        "nameUz": nameUz,
        "nameEn": nameEn,
        "count": count,
        "descriptionRu": descriptionRu,
        "descriptionUz": descriptionUz,
        "descriptionEn": descriptionEn,
        "imagePath": imagePath,
        "categoryId": categoryId,
        "price": price,
        "isCombo": isCombo,
        "modis": List<dynamic>.from(modis.map((x) => x.toJson())),
        "recommended": List<dynamic>.from((recommended??[]).map((x) => x.toJson())),
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
      return name.substring(0, 20);
    }
    return name;
  }
  String? description(String language) {
    String name = "";
    if (language == "ru") {
      name = descriptionRu ?? "";
    } else if (language == "uz") {
      name = descriptionUz ?? "";
    } else if (language == "en") {
      name = descriptionEn ?? "";
    }

    return name;
  }

  String get priceFormatted {
    final format = NumberFormat('#,##0', 'en_US');
    return format.format(priceInt).replaceAll(",", " ");
  }

  int get priceInt {
    return (price.toInt() / 100).round();
  }

  String get priceCombo {
    final format = NumberFormat('#,##0', 'en_US');
    int modiss = priceInt;

    if (isCombo) {
      Map<String, int> sumByUniqueId = {};

      for (int i = 0; i < modis.length; i++) {
        if (!sumByUniqueId.containsKey(modis[i].modiGroup.toString())) {
          sumByUniqueId[modis[i].modiGroup.toString()] = modis[i].priceInt;
        }
      }
      modiss = sumByUniqueId.values.reduce((value, element) => value + element);
    }
    return format.format(modiss).replaceAll(",", " ");
  }
}

class Modi {
  int ident;
  String? nameRu;
  String? nameUz;
  String? nameEn;
  num price;
  int maxOneDish;
  String modiGroupName;
  int modiGroup;
  int downLimit;
  int upLimit;
  bool isDefault;
  int count;

  Modi(
      {required this.ident,
      required this.nameRu,
      required this.nameUz,
      required this.nameEn,
      required this.price,
      required this.maxOneDish,
      required this.modiGroupName,
      required this.modiGroup,
      required this.downLimit,
      required this.upLimit,
      required this.isDefault,
      this.count = 0});

  Modi copyWith({
    int? ident,
    String? nameRu,
    String? nameUz,
    String? nameEn,
    num? price,
    int? maxOneDish,
    String? modiGroupName,
    int? modiGroup,
    int? downLimit,
    int? upLimit,
    bool? isDefault,
    int? count,
  }) =>
      Modi(
        ident: ident ?? this.ident,
        nameRu: nameRu ?? this.nameRu,
        nameUz: nameUz ?? this.nameUz,
        nameEn: nameEn ?? this.nameEn,
        price: price ?? this.price,
        maxOneDish: maxOneDish ?? this.maxOneDish,
        modiGroupName: modiGroupName ?? this.modiGroupName,
        modiGroup: modiGroup ?? this.modiGroup,
        downLimit: downLimit ?? this.downLimit,
        upLimit: upLimit ?? this.upLimit,
        isDefault: isDefault ?? this.isDefault,
        count: count ?? this.count,
      );

  factory Modi.fromJson(Map<String, dynamic> json) => Modi(
        ident: json["ident"],
        nameRu: json["nameRu"],
        nameUz: json["nameUz"],
        nameEn: json["nameEn"],
        price: json["price"],
        maxOneDish: json["maxOneDish"],
        modiGroupName: json["modiGroupName"],
        modiGroup: json["modiGroup"],
        downLimit: json["downLimit"],
        upLimit: json["upLimit"],
        isDefault: json["isDefault"],
      );

  Map<String, dynamic> toJson() => {
        "ident": ident,
        "nameRu": nameRu,
        "nameUz": nameUz,
        "nameEn": nameEn,
        "price": price,
        "maxOneDish": maxOneDish,
        "modiGroupName": modiGroupName,
        "modiGroup": modiGroup,
        "downLimit": downLimit,
        "upLimit": upLimit,
        "isDefault": isDefault,
        "count": count,
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
    if (name.length > 10) {
      return name.substring(0, 10);
    }
    return name;
  }

  String get priceFormatted {
    final format = NumberFormat('#,##0', 'en_US');
    return format.format(priceInt).replaceAll(",", " ");
  }

  int get priceInt {
    return (price.toInt() / 100).round();
  }

  void incrementQuantity() {
    count++;
  }

  void decrementQuantity() {
    if (count > 0) {
      count--;
    }
  }
}

class Recommended {
  int? ident;
  int? order;

  Recommended({
    required this.ident,
    required this.order,
  });

  Recommended copyWith({
    int? ident,
    int? order,
  }) =>
      Recommended(
        ident: ident ?? this.ident,
        order: order ?? this.order,
      );

  factory Recommended.fromJson(Map<String, dynamic> json) => Recommended(
        ident: json["ident"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "ident": ident,
        "order": order,
      };
}

enum ModiGroupName { THE_1 }

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
