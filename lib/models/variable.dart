// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yousual_common/models/option.dart';

class Variable {
  String variableId;
  String itemId;
  String variableName;
  String vendorId;
  String variableDescription;
  DateTime createdDateTime;
  DateTime? updatedDateTime;

  bool isRequired;
  List<Option> options;
  // enum
  TypeOfVariable variableType;

  double get price {
    double basePrice = 0;
    for (Option option in options) {
      basePrice += option.price;
    }
    return basePrice;
  }

  Variable({
    required this.variableId,
    required this.itemId,
    required this.variableName,
    required this.vendorId,
    required this.variableDescription,
    required this.createdDateTime,
    this.updatedDateTime,
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
