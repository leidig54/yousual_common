// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:yousual_common/models/category.dart';
import 'package:yousual_common/models/nutritional_info.dart';

class Item {
  String itemId;
  String itemName;
  String vendorId;
  double price;
  bool isAvailable;
  int index;
  ItumCategory? itumCategory;
  DateTime createdDateTime;
  DateTime? updatedDateTime;
  NutritionalInfo? nutritionalInfo;

  Item({
    required this.itemId,
    required this.itemName,
    required this.vendorId,
    required this.price,
    this.isAvailable = true,
    required this.index,
    this.itumCategory,
    required this.createdDateTime,
    this.updatedDateTime,
    this.nutritionalInfo,
  });

  Item copyWith({
    String? itemId,
    String? itemName,
    String? vendorId,
    double? price,
    bool? isAvailable,
    int? index,
    ItumCategory? itumCategory,
    DateTime? createdDateTime,
    DateTime? updatedDateTime,
    NutritionalInfo? nutritionalInfo,
  }) {
    return Item(
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      vendorId: vendorId ?? this.vendorId,
      price: price ?? this.price,
      isAvailable: isAvailable ?? this.isAvailable,
      index: index ?? this.index,
      itumCategory: itumCategory ?? this.itumCategory,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      updatedDateTime: updatedDateTime ?? this.updatedDateTime,
      nutritionalInfo: nutritionalInfo ?? this.nutritionalInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemId': itemId,
      'itemName': itemName,
      'vendorId': vendorId,
      'price': price,
      'isAvailable': isAvailable,
      'index': index,
      'itumCategory': itumCategory?.toMap(),
      'createdDateTime': createdDateTime.millisecondsSinceEpoch,
      'updatedDateTime': updatedDateTime?.millisecondsSinceEpoch,
      'nutritionalInfo': nutritionalInfo?.toMap(),
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      itemId: (map['itemId'] ?? '') as String,
      itemName: (map['itemName'] ?? '') as String,
      vendorId: (map['vendorId'] ?? '') as String,
      price: (map['price'] ?? 0.0) as double,
      isAvailable: (map['isAvailable'] ?? false) as bool,
      index: (map['index'] ?? 0) as int,
      itumCategory: map['itumCategory'] != null
          ? ItumCategory.fromMap(map['itumCategory'] as Map<String, dynamic>)
          : null,
      createdDateTime: DateTime.fromMillisecondsSinceEpoch(
          (map['createdDateTime'] ?? 0) as int),
      updatedDateTime: map['updatedDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (map['updatedDateTime'] ?? 0) as int)
          : null,
      nutritionalInfo: map['nutritionalInfo'] != null
          ? NutritionalInfo.fromMap(
              map['nutritionalInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}
