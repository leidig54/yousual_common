class Item {
  String itemId;
  String itemName;
  String vendorId;
  String category;
  double price;
  bool isAvailable;
  DateTime createdDateTime;
  DateTime? updatedDateTime;

  Item({
    required this.itemId,
    required this.vendorId,
    required this.itemName,
    required this.category,
    required this.price,
    this.isAvailable = true,
    required this.createdDateTime,
    this.updatedDateTime,
  });

  Item copyWith({
    String? itemId,
    String? vendorId,
    String? itemName,
    String? category,
    double? price,
    bool? isAvailable,
    DateTime? createdDateTime,
    DateTime? updatedDateTime,
  }) {
    return Item(
      itemId: itemId ?? this.itemId,
      vendorId: vendorId ?? this.vendorId,
      itemName: itemName ?? this.itemName,
      category: category ?? this.category,
      price: price ?? this.price,
      isAvailable: isAvailable ?? this.isAvailable,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      updatedDateTime: updatedDateTime ?? this.updatedDateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'itemId': itemId,
      'vendorId': vendorId,
      'itemName': itemName,
      'category': category,
      'price': price,
      'isAvailable': isAvailable,
      'createdDateTime': createdDateTime.millisecondsSinceEpoch,
      'updatedDateTime': updatedDateTime?.millisecondsSinceEpoch,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      itemId: map['itemId'] ?? '',
      vendorId: map['vendorId'] ?? '',
      itemName: map['itemName'] ?? '',
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      isAvailable: map['isAvailable'] ?? false,
      createdDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['createdDateTime']),
      updatedDateTime: map['updatedDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedDateTime'])
          : null,
    );
  }
}
