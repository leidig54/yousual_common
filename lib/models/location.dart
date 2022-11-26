// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:collection/collection.dart';

class Location {
  String locationId;
  String locationName;
  String vendorId;
  //enum
  Typeoflocation typeoflocation;
  Location({
    required this.locationId,
    required this.locationName,
    required this.vendorId,
    required this.typeoflocation,
  });

  Location copyWith({
    String? locationId,
    String? locationName,
    String? vendorId,
    Typeoflocation? typeoflocation,
  }) {
    return Location(
      locationId: locationId ?? this.locationId,
      locationName: locationName ?? this.locationName,
      vendorId: vendorId ?? this.vendorId,
      typeoflocation: typeoflocation ?? this.typeoflocation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'locationId': locationId,
      'locationName': locationName,
      'vendorId': vendorId,
      'typeoflocation': typeoflocation.name,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      locationId: (map['locationId'] ?? '') as String,
      locationName: (map['locationName'] ?? '') as String,
      vendorId: (map['vendorId'] ?? '') as String,
      typeoflocation: Typeoflocation.values.firstWhereOrNull(
              (element) => element.name == map['typeoflocation']) ??
          Typeoflocation.unknown,
    );
  }
}

enum Typeoflocation {
  table,
  counter,
  onlineTakeaway,
  onlineCollection,
  unknown,
}
