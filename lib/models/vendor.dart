class Vendor {
  String vendorId;
  String vendorName;
  List<String> categories;
  DateTime createdDateTime;
  Vendor({
    required this.vendorId,
    required this.vendorName,
    this.categories = const [],
    required this.createdDateTime,
  });

  Vendor copyWith({
    String? vendorId,
    String? vendorName,
    List<String>? categories,
    DateTime? createdDateTime,
  }) {
    return Vendor(
      vendorId: vendorId ?? this.vendorId,
      vendorName: vendorName ?? this.vendorName,
      categories: categories ?? this.categories,
      createdDateTime: createdDateTime ?? this.createdDateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'vendorId': vendorId,
      'vendorName': vendorName,
      'categories': categories,
      'createdDateTime': createdDateTime.millisecondsSinceEpoch,
    };
  }

  factory Vendor.fromMap(Map<String, dynamic> map) {
    return Vendor(
      vendorId: map['vendorId'] ?? '',
      vendorName: map['vendorName'] ?? '',
      categories: List<String>.from(map['categories'] ?? const []),
      createdDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['createdDateTime']),
    );
  }
}
