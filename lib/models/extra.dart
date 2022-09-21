class Extra {
  String extraId;
  String itemId;
  String extraName;
  double price;
  DateTime createdDateTime;
  DateTime? updatedDateTime;
  Extra({
    required this.extraId,
    required this.itemId,
    required this.extraName,
    required this.price,
    required this.createdDateTime,
    this.updatedDateTime,
  });

  Extra copyWith({
    String? extraId,
    String? itemId,
    String? extraName,
    double? price,
    DateTime? createdDateTime,
    DateTime? updatedDateTime,
  }) {
    return Extra(
      extraId: extraId ?? this.extraId,
      itemId: itemId ?? this.itemId,
      extraName: extraName ?? this.extraName,
      price: price ?? this.price,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      updatedDateTime: updatedDateTime ?? this.updatedDateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'extraId': extraId,
      'itemId': itemId,
      'extraName': extraName,
      'price': price,
      'createdDateTime': createdDateTime.millisecondsSinceEpoch,
      'updatedDateTime': updatedDateTime?.millisecondsSinceEpoch,
    };
  }

  factory Extra.fromMap(Map<String, dynamic> map) {
    return Extra(
      extraId: map['extraId'] ?? '',
      itemId: map['itemId'] ?? '',
      extraName: map['extraName'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      createdDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['createdDateTime']),
      updatedDateTime: map['updatedDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedDateTime'])
          : null,
    );
  }
}
