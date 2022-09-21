class Category {
  String categoryId;
  String vendorId;
  String description;
  int index;
  Category({
    required this.categoryId,
    required this.vendorId,
    required this.description,
    required this.index,
  });

  Category copyWith({
    String? categoryId,
    String? vendorId,
    String? description,
    int? index,
  }) {
    return Category(
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

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      categoryId: map['categoryId'] ?? '',
      vendorId: map['vendorId'] ?? '',
      description: map['description'] ?? '',
      index: map['index']?.toInt() ?? 0,
    );
  }
}
