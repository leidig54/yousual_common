class ItumCategory {
  String categoryName;
  String categoryId;
  String vendorId;
  String description;
  int index;
  ItumCategory({
    required this.categoryName,
    required this.categoryId,
    required this.vendorId,
    required this.description,
    required this.index,
  });

  ItumCategory copyWith({
    String? categoryName,
    String? categoryId,
    String? vendorId,
    String? description,
    int? index,
  }) {
    return ItumCategory(
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

  factory ItumCategory.fromMap(Map<String, dynamic> map) {
    return ItumCategory(
      categoryName: map['categoryName'] ?? '',
      categoryId: map['categoryId'] ?? '',
      vendorId: map['vendorId'] ?? '',
      description: map['description'] ?? '',
      index: map['index']?.toInt() ?? 0,
    );
  }
}
