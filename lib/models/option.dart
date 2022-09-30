// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';
import 'package:yousual_common/models/ingredient.dart';
import 'package:yousual_common/models/nutritional_info.dart';
import 'package:yousual_common/models/tag.dart';

final formatCurrency = NumberFormat.simpleCurrency(locale: "en_GB");

class Option {
  String optionId;
  String optionName;
  String optionDescription;
  String itemId;
  String variableId;
  String vendorId;
  double price;
  NutritionalInfo? nutritionalInfo;
  List<Ingredient> ingredients;
  List<Tag> tags;
  Option({
    required this.optionId,
    required this.optionName,
    required this.optionDescription,
    required this.itemId,
    required this.variableId,
    required this.vendorId,
    required this.price,
    this.nutritionalInfo,
    required this.ingredients,
    required this.tags,
  });

  String get formattedPrice {
    return formatCurrency.format(price);
  }

  Option copyWith({
    String? optionId,
    String? optionName,
    String? optionDescription,
    String? itemId,
    String? variableId,
    String? vendorId,
    double? price,
    NutritionalInfo? nutritionalInfo,
    List<Ingredient>? ingredients,
    List<Tag>? tags,
  }) {
    return Option(
      optionId: optionId ?? this.optionId,
      optionName: optionName ?? this.optionName,
      optionDescription: optionDescription ?? this.optionDescription,
      itemId: itemId ?? this.itemId,
      variableId: variableId ?? this.variableId,
      vendorId: vendorId ?? this.vendorId,
      price: price ?? this.price,
      nutritionalInfo: nutritionalInfo ?? this.nutritionalInfo,
      ingredients: ingredients ?? this.ingredients,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'optionId': optionId,
      'optionName': optionName,
      'optionDescription': optionDescription,
      'itemId': itemId,
      'variableId': variableId,
      'vendorId': vendorId,
      'price': price,
      'nutritionalInfo': nutritionalInfo?.toMap(),
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
      'tags': tags.map((x) => x.toMap()).toList(),
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      optionId: (map['optionId'] ?? '') as String,
      optionName: (map['optionName'] ?? '') as String,
      optionDescription: (map['optionDescription'] ?? '') as String,
      itemId: (map['itemId'] ?? '') as String,
      variableId: (map['variableId'] ?? '') as String,
      vendorId: (map['vendorId'] ?? '') as String,
      price: (map['price'] ?? 0.0) as double,
      nutritionalInfo: map['nutritionalInfo'] != null
          ? NutritionalInfo.fromMap(
              map['nutritionalInfo'] as Map<String, dynamic>)
          : null,
      ingredients: List<Ingredient>.from(
        (map['ingredients'] ?? const []).map(
          (x) => Ingredient.fromMap(x as Map<String, dynamic>),
        ),
      ),
      tags: List<Tag>.from(
        (map['tags'] ?? const []).map(
          (x) => Tag.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
