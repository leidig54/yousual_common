// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';

class Location {
  String locationId;
  String locationName;
  String vendorId;
  //enum
  TypeOfLocation locationType;
  Location({
    required this.locationId,
    required this.locationName,
    required this.vendorId,
    required this.locationType,
  });

  Location copyWith({
    String? locationId,
    String? locationName,
    String? vendorId,
    TypeOfLocation? locationType,
  }) {
    return Location(
      locationId: locationId ?? this.locationId,
      locationName: locationName ?? this.locationName,
      vendorId: vendorId ?? this.vendorId,
      locationType: locationType ?? this.locationType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'locationId': locationId,
      'locationName': locationName,
      'vendorId': vendorId,
      'locationType': locationType.name,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      locationId: (map['locationId'] ?? '') as String,
      locationName: (map['locationName'] ?? '') as String,
      vendorId: (map['vendorId'] ?? '') as String,
      locationType: TypeOfLocation.values.firstWhereOrNull(
              (element) => element.name == map['typeoflocation']) ??
          TypeOfLocation.values[0],
    );
  }
}

enum TypeOfLocation {
  internalLoction,
  externalLocation,
  unknownLocation,
}
