// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yousual_common/models/ingredient.dart';
import 'package:yousual_common/models/nutritional_info.dart';
import 'package:yousual_common/models/option.dart';
import 'package:yousual_common/models/tag.dart';

class Variable {
  String variableId;
  String itemId;
  String variableName;
  String vendorId;
  String variableDescription;
  DateTime createdDateTime;
  DateTime? updatedDateTime;
  NutritionalInfo? nutritionalInfo;
  List<Ingredient> ingredients;
  List<Tag> tags;
  bool isRequired;
  List<Option> options;
  // enum
  TypeOfVariable variableType;

  Variable({
    required this.variableId,
    required this.itemId,
    required this.variableName,
    required this.vendorId,
    required this.variableDescription,
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
    String? variableId,
    String? itemId,
    String? variableName,
    String? vendorId,
    String? variableDescription,
    DateTime? createdDateTime,
    DateTime? updatedDateTime,
    NutritionalInfo? nutritionalInfo,
    List<Ingredient>? ingredients,
    List<Tag>? tags,
    bool? isRequired,
    List<Option>? options,
    TypeOfVariable? variableType,
  }) {
    return Variable(
      variableId: variableId ?? this.variableId,
      itemId: itemId ?? this.itemId,
      variableName: variableName ?? this.variableName,
      vendorId: vendorId ?? this.vendorId,
      variableDescription: variableDescription ?? this.variableDescription,
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
      'variableId': variableId,
      'itemId': itemId,
      'variableName': variableName,
      'vendorId': vendorId,
      'variableDescription': variableDescription,
      'createdDateTime': createdDateTime.millisecondsSinceEpoch,
      'updatedDateTime': updatedDateTime?.millisecondsSinceEpoch,
      'nutritionalInfo': nutritionalInfo?.toMap(),
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
      'tags': tags.map((x) => x.toMap()).toList(),
      'isRequired': isRequired,
      'options': options.map((x) => x.toMap()).toList(),
      'variableType': variableType.index,
    };
  }

  factory Variable.fromMap(Map<String, dynamic> map) {
    return Variable(
      variableId: (map['variableId'] ?? '') as String,
      itemId: (map['itemId'] ?? '') as String,
      variableName: (map['variableName'] ?? '') as String,
      vendorId: (map['vendorId'] ?? '') as String,
      variableDescription: (map['variableDescription'] ?? '') as String,
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
      options: List<Option>.from(
        (map['options'] ?? const []).map(
          (x) => Option.fromMap(x as Map<String, dynamic>),
        ),
      ),
      variableType: TypeOfVariable.values[(map['variableType'] ?? 0) as int],
    );
  }
}

enum TypeOfVariable {
  single,
  multiple,
}
