// ignore_for_file: public_member_api_docs, sort_constructors_first

class Vendor {
  String vendorId;
  String vendorName;
  DateTime createdDateTime;
  bool isTakingOrders;
  String resetPasscode;
  Vendor({
    required this.vendorId,
    required this.vendorName,
    required this.createdDateTime,
    required this.isTakingOrders,
    required this.resetPasscode,
  });

  Vendor copyWith({
    String? vendorId,
    String? vendorName,
    DateTime? createdDateTime,
    bool? isTakingOrders,
    String? resetPasscode,
  }) {
    return Vendor(
      vendorId: vendorId ?? this.vendorId,
      vendorName: vendorName ?? this.vendorName,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      isTakingOrders: isTakingOrders ?? this.isTakingOrders,
      resetPasscode: resetPasscode ?? this.resetPasscode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vendorId': vendorId,
      'vendorName': vendorName,
      'createdDateTime': createdDateTime.millisecondsSinceEpoch,
      'isTakingOrders': isTakingOrders,
      'resetPasscode': resetPasscode,
    };
  }

  factory Vendor.fromMap(Map<String, dynamic> map) {
    return Vendor(
      vendorId: (map['vendorId'] ?? '') as String,
      vendorName: (map['vendorName'] ?? '') as String,
      createdDateTime: DateTime.fromMillisecondsSinceEpoch(
          (map['createdDateTime'] ?? 0) as int),
      isTakingOrders: (map['isTakingOrders'] ?? false) as bool,
      resetPasscode: (map['resetPasscode'] ?? '') as String,
    );
  }
}
