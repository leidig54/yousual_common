// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:collection/collection.dart';

class Location {
  String locationId;
  String locationName;
  String vendorId;
  //enum
  Typeoflocation typeOfLocation;
  Location({
    required this.locationId,
    required this.locationName,
    required this.vendorId,
    required this.typeOfLocation,
  });

  Location copyWith({
    String? locationId,
    String? locationName,
    String? vendorId,
    Typeoflocation? typeOfLocation,
  }) {
    return Location(
      locationId: locationId ?? this.locationId,
      locationName: locationName ?? this.locationName,
      vendorId: vendorId ?? this.vendorId,
      typeOfLocation: typeOfLocation ?? this.typeOfLocation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'locationId': locationId,
      'locationName': locationName,
      'vendorId': vendorId,
      'typeOfLocation': typeOfLocation.name,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      locationId: (map['locationId'] ?? '') as String,
      locationName: (map['locationName'] ?? '') as String,
      vendorId: (map['vendorId'] ?? '') as String,
      typeOfLocation: Typeoflocation.values.firstWhereOrNull(
              (element) => element.name == map['typeoflocation']) ??
          Typeoflocation.values[0],
    );
  }
}

enum Typeoflocation {
  internalLoction,
  externalLocation,
  unknownLocation,
}
