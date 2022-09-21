import 'package:yousual_common/models/category.dart';

class Item {
  String itemId;
  String itemName;
  String vendorId;
  Category category;
  double price;
  bool isAvailable;
  DateTime createdDateTime;
  DateTime? updatedDateTime;

  Item({
    required this.itemId,
    required this.itemName,
    required this.vendorId,
    required this.category,
    required this.price,
    this.isAvailable = true,
    required this.createdDateTime,
    this.updatedDateTime,
  });

  Item copyWith({
    String? itemId,
    String? itemName,
    String? vendorId,
    Category? category,
    double? price,
    bool? isAvailable,
    DateTime? createdDateTime,
    DateTime? updatedDateTime,
  }) {
    return Item(
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      vendorId: vendorId ?? this.vendorId,
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
      'itemName': itemName,
      'vendorId': vendorId,
      'category': category.toMap(),
      'price': price,
      'isAvailable': isAvailable,
      'createdDateTime': createdDateTime.millisecondsSinceEpoch,
      'updatedDateTime': updatedDateTime?.millisecondsSinceEpoch,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      itemId: map['itemId'] ?? '',
      itemName: map['itemName'] ?? '',
      vendorId: map['vendorId'] ?? '',
      category: Category.fromMap(map['category']),
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
