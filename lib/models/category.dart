class ItemCategory {
  String categoryName;
  String categoryId;
  String vendorId;
  String description;
  int index;
  ItemCategory({
    required this.categoryName,
    required this.categoryId,
    required this.vendorId,
    required this.description,
    required this.index,
  });

  ItemCategory copyWith({
    String? categoryName,
    String? categoryId,
    String? vendorId,
    String? description,
    int? index,
  }) {
    return ItemCategory(
      categoryName: categoryName ?? this.categoryName,
      categoryId: categoryId ?? this.categoryId,
      vendorId: vendorId ?? this.vendorId,
      description: description ?? this.description,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'categoryId': categoryId,
      'vendorId': vendorId,
      'description': description,
      'index': index,
    };
  }

  factory ItemCategory.fromMap(Map<String, dynamic> map) {
    return ItemCategory(
      categoryName: map['categoryName'] ?? '',
      categoryId: map['categoryId'] ?? '',
      vendorId: map['vendorId'] ?? '',
      description: map['description'] ?? '',
      index: map['index']?.toInt() ?? 0,
    );
  }
}
