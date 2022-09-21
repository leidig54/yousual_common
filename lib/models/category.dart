class ItemCategory {
  String categoryId;
  String vendorId;
  String description;
  int index;
  ItemCategory({
    required this.categoryId,
    required this.vendorId,
    required this.description,
    required this.index,
  });

  ItemCategory copyWith({
    String? categoryId,
    String? vendorId,
    String? description,
    int? index,
  }) {
    return ItemCategory(
      categoryId: categoryId ?? this.categoryId,
      vendorId: vendorId ?? this.vendorId,
      description: description ?? this.description,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'vendorId': vendorId,
      'description': description,
      'index': index,
    };
  }

  factory ItemCategory.fromMap(Map<String, dynamic> map) {
    return ItemCategory(
      categoryId: map['categoryId'] ?? '',
      vendorId: map['vendorId'] ?? '',
      description: map['description'] ?? '',
      index: map['index']?.toInt() ?? 0,
    );
  }
}
