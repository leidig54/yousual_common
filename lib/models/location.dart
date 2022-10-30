// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';

class Location {
  String locationId;
  String vendorId;
  String userId;
  //enum
  TypeOfLocation locationType;
  Location({
    required this.locationId,
    required this.vendorId,
    required this.userId,
    required this.locationType,
  });

  Location copyWith({
    String? locationId,
    String? vendorId,
    String? userId,
    TypeOfLocation? locationType,
  }) {
    return Location(
      locationId: locationId ?? this.locationId,
      vendorId: vendorId ?? this.vendorId,
      userId: userId ?? this.userId,
      locationType: locationType ?? this.locationType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'locationId': locationId,
      'vendorId': vendorId,
      'userId': userId,
      'locationType': locationType.name,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      locationId: (map['locationId'] ?? '') as String,
      vendorId: (map['vendorId'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      locationType: TypeOfLocation.values.firstWhereOrNull(
              (element) => element.name == map['typeoflocation']) ??
          TypeOfLocation.values[0],
    );
  }
}

enum TypeOfLocation {
  table,
  counter,
  unknown,
}
