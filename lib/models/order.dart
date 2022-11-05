// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';
import 'package:yousual_common/models/item.dart';
import 'package:yousual_common/models/location.dart';

final formatCurrency = NumberFormat.simpleCurrency(locale: "en_GB");

class Order {
  String orderId;
  String userId;
  String userName;
  String vendorId;
  String vendorName;
  List<Item> items = [];
  Location location;
  Map<String, DateTime> paymentStatus;
  Map<String, DateTime> fulfillmentStatus;

  Order({
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

  String get formattedPrice {
    return formatCurrency.format(price);
  }

  Order copyWith({
    String? orderId,
    String? userId,
    String? userName,
    String? vendorId,
    String? vendorName,
    List<Item>? items,
    Location? location,
    Map<String, DateTime>? paymentStatus,
    Map<String, DateTime>? fulfillmentStatus,
  }) {
    return Order(
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

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
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
      paymentStatus: Map<String, DateTime>.from(
          (map['paymentStatus'] ?? const <Map<String, DateTime>>{})),
      fulfillmentStatus: Map<String, DateTime>.from(
          (map['fulfillmentStatus'] ?? const <Map<String, DateTime>>{})),
    );
  }
}
