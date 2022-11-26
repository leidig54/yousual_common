// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:yousual_common/models/item.dart';
import 'package:yousual_common/models/location.dart';

final formatCurrency = NumberFormat.simpleCurrency(locale: "en_GB");

class YousualOrder {
  String orderId;
  String userId;
  String userName;
  String vendorId;
  String vendorName;
  List<Item> items = [];
  Location location;
  Map<String, Timestamp> paymentStatus;
  Map<String, Timestamp> fulfillmentStatus;

  YousualOrder({
    required this.orderId,
    required this.userId,
    required this.userName,
    required this.vendorId,
    required this.vendorName,
    this.items = const [],
    required this.location,
    required this.paymentStatus,
    required this.fulfillmentStatus,
  });

  num get price {
    num standingPrice = 0;
    for (Item item in items) {
      standingPrice += item.price;
    }
    return standingPrice;
  }

  Map<String, Timestamp> get sortedFulfillmentStatus {
    return Map.fromEntries(fulfillmentStatus.entries.toList()
      ..sort((e1, e2) => e1.value.compareTo(e2.value)));
  }

  String get formattedPrice {
    return formatCurrency.format(price);
  }

  String get latestFulfillmentStatus {
    var sortedByValueMap = Map.fromEntries(fulfillmentStatus.entries.toList()
      ..sort((e1, e2) => e1.value.compareTo(e2.value)));
    return sortedByValueMap.entries.last.key;
  }

  String get formattedLatestStatusDateTime {
    return "${DateFormat.Hm().format(fulfillmentStatus[latestFulfillmentStatus]!.toDate())} ${DateFormat.MMMEd().format(fulfillmentStatus[latestFulfillmentStatus]!.toDate())}";
  }

  String? getFormattedStatusDateTime(String status) {
    if (fulfillmentStatus[status] == null) {
      return null;
    }
    return "${DateFormat.Hm().format(fulfillmentStatus[status]!.toDate())} ${DateFormat.MMMEd().format(fulfillmentStatus[status]!.toDate())}";
  }

  YousualOrder copyWith({
    String? orderId,
    String? userId,
    String? userName,
    String? vendorId,
    String? vendorName,
    List<Item>? items,
    Location? location,
    Map<String, Timestamp>? paymentStatus,
    Map<String, Timestamp>? fulfillmentStatus,
  }) {
    return YousualOrder(
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      vendorId: vendorId ?? this.vendorId,
      vendorName: vendorName ?? this.vendorName,
      items: items ?? this.items,
      location: location ?? this.location,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      fulfillmentStatus: fulfillmentStatus ?? this.fulfillmentStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'userId': userId,
      'userName': userName,
      'vendorId': vendorId,
      'vendorName': vendorName,
      'items': items.map((x) => x.toMap()).toList(),
      'location': location.toMap(),
      'paymentStatus': paymentStatus,
      'fulfillmentStatus': fulfillmentStatus,
    };
  }

  factory YousualOrder.fromMap(Map<String, dynamic> map) {
    return YousualOrder(
      orderId: (map['orderId'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      userName: (map['userName'] ?? '') as String,
      vendorId: (map['vendorId'] ?? '') as String,
      vendorName: (map['vendorName'] ?? '') as String,
      items: List<Item>.from(
        (map['items'] ?? const []).map(
          (x) => Item.fromMap(x as Map<String, dynamic>),
        ),
      ),
      location: Location.fromMap(map['location'] as Map<String, dynamic>),
      paymentStatus: Map<String, Timestamp>.from(
          (map['paymentStatus'] ?? const <Map<String, Timestamp>>{})),
      fulfillmentStatus: Map<String, Timestamp>.from(
          (map['fulfillmentStatus'] ?? const <Map<String, Timestamp>>{})),
    );
  }
}
