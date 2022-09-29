// ignore_for_file: public_member_api_docs, sort_constructors_first
class Option {
  String optionId;
  String optionName;
  String optionDescription;
  String itemId;
  String extraId;
  String vendorId;
  double price;
  Option({
    required this.optionId,
    required this.optionName,
    required this.optionDescription,
    required this.itemId,
    required this.extraId,
    required this.vendorId,
    required this.price,
  });

  Option copyWith({
    String? optionId,
    String? optionName,
    String? optionDescription,
    String? itemId,
    String? extraId,
    String? vendorId,
    double? price,
  }) {
    return Option(
      optionId: optionId ?? this.optionId,
      optionName: optionName ?? this.optionName,
      optionDescription: optionDescription ?? this.optionDescription,
      itemId: itemId ?? this.itemId,
      extraId: extraId ?? this.extraId,
      vendorId: vendorId ?? this.vendorId,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'optionId': optionId,
      'optionName': optionName,
      'optionDescription': optionDescription,
      'itemId': itemId,
      'extraId': extraId,
      'vendorId': vendorId,
      'price': price,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      optionId: (map['optionId'] ?? '') as String,
      optionName: (map['optionName'] ?? '') as String,
      optionDescription: (map['optionDescription'] ?? '') as String,
      itemId: (map['itemId'] ?? '') as String,
      extraId: (map['extraId'] ?? '') as String,
      vendorId: (map['vendorId'] ?? '') as String,
      price: (map['price'] ?? 0.0) as double,
    );
  }
}
