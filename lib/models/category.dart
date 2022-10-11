// ignore_for_file: public_member_api_docs, sort_constructors_first
class ItumCategory {
  String categoryName;
  String categoryId;
  String vendorId;
  String description;
  int index;
  List<String> itemIds = [];
  ItumCategory({
    required this.categoryName,
    required this.categoryId,
    required this.vendorId,
    required this.description,
    required this.index,
    required this.itemIds,
  });
//
  ItumCategory copyWith({
    String? categoryName,
    String? categoryId,
    String? vendorId,
    String? description,
    int? index,
    List<String>? itemIds,
  }) {
    return ItumCategory(
      categoryName: categoryName ?? this.categoryName,
      categoryId: categoryId ?? this.categoryId,
      vendorId: vendorId ?? this.vendorId,
      description: description ?? this.description,
      index: index ?? this.index,
      itemIds: itemIds ?? this.itemIds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryName': categoryName,
      'categoryId': categoryId,
      'vendorId': vendorId,
      'description': description,
      'index': index,
      'itemIds': itemIds,
    };
  }

  factory ItumCategory.fromMap(Map<String, dynamic> map) {
    return ItumCategory(
      categoryName: (map['categoryName'] ?? '') as String,
      categoryId: (map['categoryId'] ?? '') as String,
      vendorId: (map['vendorId'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      index: (map['index'] ?? 0) as int,
      itemIds: List<String>.from((map['itemIds'] ?? const <String>[])),
    );
  }
}
