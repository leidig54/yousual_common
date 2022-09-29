// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yousual_common/models/ingredient.dart';
import 'package:yousual_common/models/nutritional_info.dart';
import 'package:yousual_common/models/tag.dart';

class Variable {
  String extraId;
  String itemId;
  String extraName;
  String vendorId;
  String variableDescription;
  double price;
  DateTime createdDateTime;
  DateTime? updatedDateTime;
  NutritionalInfo? nutritionalInfo;
  List<Ingredient> ingredients;
  List<Tag> tags;
  bool isRequired;
  List<String> options;
  // enum
  TypeOfVariable variableType;

  Variable({
    required this.extraId,
    required this.itemId,
    required this.extraName,
    required this.vendorId,
    required this.variableDescription,
    required this.price,
    required this.createdDateTime,
    this.updatedDateTime,
    this.nutritionalInfo,
    required this.ingredients,
    required this.tags,
    required this.isRequired,
    required this.options,
    required this.variableType,
  });

  Variable copyWith({
    String? extraId,
    String? itemId,
    String? extraName,
    String? vendorId,
    String? variableDescription,
    double? price,
    DateTime? createdDateTime,
    DateTime? updatedDateTime,
    NutritionalInfo? nutritionalInfo,
    List<Ingredient>? ingredients,
    List<Tag>? tags,
    bool? isRequired,
    List<String>? options,
    TypeOfVariable? variableType,
  }) {
    return Variable(
      extraId: extraId ?? this.extraId,
      itemId: itemId ?? this.itemId,
      extraName: extraName ?? this.extraName,
      vendorId: vendorId ?? this.vendorId,
      variableDescription: variableDescription ?? this.variableDescription,
      price: price ?? this.price,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      updatedDateTime: updatedDateTime ?? this.updatedDateTime,
      nutritionalInfo: nutritionalInfo ?? this.nutritionalInfo,
      ingredients: ingredients ?? this.ingredients,
      tags: tags ?? this.tags,
      isRequired: isRequired ?? this.isRequired,
      options: options ?? this.options,
      variableType: variableType ?? this.variableType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'extraId': extraId,
      'itemId': itemId,
      'extraName': extraName,
      'vendorId': vendorId,
      'variableDescription': variableDescription,
      'price': price,
      'createdDateTime': createdDateTime.millisecondsSinceEpoch,
      'updatedDateTime': updatedDateTime?.millisecondsSinceEpoch,
      'nutritionalInfo': nutritionalInfo?.toMap(),
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
      'tags': tags.map((x) => x.toMap()).toList(),
      'isRequired': isRequired,
      'options': options,
      'variableType': variableType.index,
    };
  }

  factory Variable.fromMap(Map<String, dynamic> map) {
    return Variable(
      extraId: (map['extraId'] ?? '') as String,
      itemId: (map['itemId'] ?? '') as String,
      extraName: (map['extraName'] ?? '') as String,
      vendorId: (map['vendorId'] ?? '') as String,
      variableDescription: (map['variableDescription'] ?? '') as String,
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
        (map['ingredients'] ?? const []).map(
          (x) => Ingredient.fromMap(x as Map<String, dynamic>),
        ),
      ),
      tags: List<Tag>.from(
        (map['tags'] ?? const []).map(
          (x) => Tag.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isRequired: (map['isRequired'] ?? false) as bool,
      options: List<String>.from(
          (map['options'] ?? const <String>[]) as List<String>),
      variableType: TypeOfVariable.values[(map['variableType'] ?? 0) as int],
    );
  }
}

enum TypeOfVariable {
  single,
  multiple,
  boolean,
}
