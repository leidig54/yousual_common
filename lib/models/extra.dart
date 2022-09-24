// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yousual_common/models/ingredient.dart';
import 'package:yousual_common/models/nutritional_info.dart';

class Extra {
  String extraId;
  String itemId;
  String extraName;
  double price;
  DateTime createdDateTime;
  DateTime? updatedDateTime;
  NutritionalInfo? nutritionalInfo;
  List<Ingredient> ingredients = [];
  List<String> tags = [];

  Extra({
    required this.extraId,
    required this.itemId,
    required this.extraName,
    required this.price,
    required this.createdDateTime,
    this.updatedDateTime,
    this.nutritionalInfo,
    required this.ingredients,
    required this.tags,
  });

  Extra copyWith({
    String? extraId,
    String? itemId,
    String? extraName,
    double? price,
    DateTime? createdDateTime,
    DateTime? updatedDateTime,
    NutritionalInfo? nutritionalInfo,
    List<Ingredient>? ingredients,
    List<String>? tags,
  }) {
    return Extra(
      extraId: extraId ?? this.extraId,
      itemId: itemId ?? this.itemId,
      extraName: extraName ?? this.extraName,
      price: price ?? this.price,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      updatedDateTime: updatedDateTime ?? this.updatedDateTime,
      nutritionalInfo: nutritionalInfo ?? this.nutritionalInfo,
      ingredients: ingredients ?? this.ingredients,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'extraId': extraId,
      'itemId': itemId,
      'extraName': extraName,
      'price': price,
      'createdDateTime': createdDateTime.millisecondsSinceEpoch,
      'updatedDateTime': updatedDateTime?.millisecondsSinceEpoch,
      'nutritionalInfo': nutritionalInfo?.toMap(),
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
      'tags': tags,
    };
  }

  factory Extra.fromMap(Map<String, dynamic> map) {
    return Extra(
      extraId: (map['extraId'] ?? '') as String,
      itemId: (map['itemId'] ?? '') as String,
      extraName: (map['extraName'] ?? '') as String,
      price: (map['price'] ?? 0.0) as double,
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
      ingredients: List<Ingredient>.from(
        (map['ingredients'] as List<dynamic>).map<Ingredient>(
          (x) => Ingredient.fromMap(x as Map<String, dynamic>),
        ),
      ),
      tags:
          List<String>.from((map['tags'] ?? const <String>[]) as List<String>),
    );
  }
}
