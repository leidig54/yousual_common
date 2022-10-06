// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ingredient {
  String name;
  String ingredientId;
  String vendorId;
  List<String> itemIds;
  Ingredient({
    required this.name,
    required this.ingredientId,
    required this.vendorId,
    required this.itemIds,
  });

  Ingredient copyWith({
    String? name,
    String? ingredientId,
    String? vendorId,
    List<String>? itemIds,
  }) {
    return Ingredient(
      name: name ?? this.name,
      ingredientId: ingredientId ?? this.ingredientId,
      vendorId: vendorId ?? this.vendorId,
      itemIds: itemIds ?? this.itemIds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'ingredientId': ingredientId,
      'vendorId': vendorId,
      'itemIds': itemIds,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      name: (map['name'] ?? '') as String,
      ingredientId: (map['ingredientId'] ?? '') as String,
      vendorId: (map['vendorId'] ?? '') as String,
      itemIds: List<String>.from((map['itemIds'] ?? const <String>[])),
    );
  }
}
