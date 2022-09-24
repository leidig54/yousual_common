// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:intl/intl.dart';
import 'package:yousual_common/models/category.dart';
import 'package:yousual_common/models/extra.dart';
import 'package:yousual_common/models/ingredient.dart';
import 'package:yousual_common/models/nutritional_info.dart';
import 'package:yousual_common/models/tag.dart';

final formatCurrency = NumberFormat.simpleCurrency(locale: "en_GB");

class Item {
  String itemId;
  String itemName;
  String vendorId;
  double basePrice;
  bool isAvailable;
  int index;
  ItumCategory? itumCategory;
  DateTime createdDateTime;
  DateTime? updatedDateTime;
  NutritionalInfo? nutritionalInfo;
  List<Extra> extras;
  List<Tag> tags;
  List<Ingredient> ingredients;

  double get price {
    double standingPrice = basePrice;
    for (Extra extra in extras) {
      standingPrice += extra.price;
    }
    return standingPrice;
  }

  String get formattedPrice {
    return formatCurrency.format(price);
  }

  Item({
    required this.itemId,
    required this.itemName,
    required this.vendorId,
    required this.basePrice,
    this.isAvailable = true,
    required this.index,
    this.itumCategory,
    required this.createdDateTime,
    this.updatedDateTime,
    this.nutritionalInfo,
    required this.extras,
    required this.tags,
    required this.ingredients,
  });

  Item copyWith({
    String? itemId,
    String? itemName,
    String? vendorId,
    double? basePrice,
    bool? isAvailable,
    int? index,
    ItumCategory? itumCategory,
    DateTime? createdDateTime,
    DateTime? updatedDateTime,
    NutritionalInfo? nutritionalInfo,
    List<Extra>? extras,
    List<Tag>? tags,
    List<Ingredient>? ingredients,
  }) {
    return Item(
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      vendorId: vendorId ?? this.vendorId,
      basePrice: basePrice ?? this.basePrice,
      isAvailable: isAvailable ?? this.isAvailable,
      index: index ?? this.index,
      itumCategory: itumCategory ?? this.itumCategory,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      updatedDateTime: updatedDateTime ?? this.updatedDateTime,
      nutritionalInfo: nutritionalInfo ?? this.nutritionalInfo,
      extras: extras ?? this.extras,
      tags: tags ?? this.tags,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemId': itemId,
      'itemName': itemName,
      'vendorId': vendorId,
      'basePrice': basePrice,
      'isAvailable': isAvailable,
      'index': index,
      'itumCategory': itumCategory?.toMap(),
      'createdDateTime': createdDateTime.millisecondsSinceEpoch,
      'updatedDateTime': updatedDateTime?.millisecondsSinceEpoch,
      'nutritionalInfo': nutritionalInfo?.toMap(),
      'extras': extras.map((x) => x.toMap()).toList(),
      'tags': tags.map((x) => x.toMap()).toList(),
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      itemId: (map['itemId'] ?? '') as String,
      itemName: (map['itemName'] ?? '') as String,
      vendorId: (map['vendorId'] ?? '') as String,
      basePrice: (map['basePrice'] ?? 0.0) as double,
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
      extras: List<Extra>.from(
        (map['extras'] as List<dynamic>).map<Extra>(
          (x) => Extra.fromMap(x as Map<String, dynamic>),
        ),
      ),
      tags: List<Tag>.from(
        (map['tags'] as List<dynamic>).map<Tag>(
          (x) => Tag.fromMap(x as Map<String, dynamic>),
        ),
      ),
      ingredients: List<Ingredient>.from(
        (map['ingredients'] as List<dynamic>).map<Ingredient>(
          (x) => Ingredient.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
