// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
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
  DateTime createdDateTime;
  DateTime? sentDateTime;
  DateTime? receivedDateTime;
  DateTime? processingDateTime;
  DateTime? readyDateTime;
  DateTime? completeDateTime;
  Location? location;

  // enum
  Fulfillmentstatus fulfillmentstatus;

  //enum
  Paymentstatus paymentstatus;
  Order({
    required this.orderId,
    required this.userId,
    required this.userName,
    required this.vendorId,
    required this.vendorName,
    this.items = const [],
    required this.createdDateTime,
    this.sentDateTime,
    this.receivedDateTime,
    this.processingDateTime,
    this.readyDateTime,
    this.completeDateTime,
    required this.location,
    required this.fulfillmentstatus,
    required this.paymentstatus,
  });

  num get price {
    num standingPrice = 0;
    for (Item item in items) {
      standingPrice += item.price;
    }
    return standingPrice;
  }

  String get formattedCreatedDateTime {
    return "${DateFormat.Hm().format(createdDateTime)} ${DateFormat.MMMEd().format(createdDateTime)}";
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
    DateTime? createdDateTime,
    DateTime? sentDateTime,
    DateTime? receivedDateTime,
    DateTime? processingDateTime,
    DateTime? readyDateTime,
    DateTime? completeDateTime,
    Location? location,
    Fulfillmentstatus? fulfillmentstatus,
    Paymentstatus? paymentstatus,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      vendorId: vendorId ?? this.vendorId,
      vendorName: vendorName ?? this.vendorName,
      items: items ?? this.items,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      sentDateTime: sentDateTime ?? this.sentDateTime,
      receivedDateTime: receivedDateTime ?? this.receivedDateTime,
      processingDateTime: processingDateTime ?? this.processingDateTime,
      readyDateTime: readyDateTime ?? this.readyDateTime,
      completeDateTime: completeDateTime ?? this.completeDateTime,
      location: location ?? this.location,
      fulfillmentstatus: fulfillmentstatus ?? this.fulfillmentstatus,
      paymentstatus: paymentstatus ?? this.paymentstatus,
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
      'createdDateTime': createdDateTime.millisecondsSinceEpoch,
      'sentDateTime': sentDateTime?.millisecondsSinceEpoch,
      'receivedDateTime': receivedDateTime?.millisecondsSinceEpoch,
      'processingDateTime': processingDateTime?.millisecondsSinceEpoch,
      'readyDateTime': readyDateTime?.millisecondsSinceEpoch,
      'completeDateTime': completeDateTime?.millisecondsSinceEpoch,
      'location': location?.toMap(),
      'fulfillmentstatus': fulfillmentstatus.name,
      'paymentstatus': paymentstatus.name,
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
      createdDateTime: DateTime.fromMillisecondsSinceEpoch(
          (map['createdDateTime'] ?? 0) as int),
      sentDateTime: map['sentDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (map['sentDateTime'] ?? 0) as int)
          : null,
      receivedDateTime: map['receivedDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (map['receivedDateTime'] ?? 0) as int)
          : null,
      processingDateTime: map['processingDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (map['processingDateTime'] ?? 0) as int)
          : null,
      readyDateTime: map['readyDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (map['readyDateTime'] ?? 0) as int)
          : null,
      completeDateTime: map['completeDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (map['completeDateTime'] ?? 0) as int)
          : null,
      location: map['location'] != null
          ? Location.fromMap(map['location'] as Map<String, dynamic>)
          : null,
      fulfillmentstatus: Fulfillmentstatus.values.firstWhereOrNull(
              (element) => element.name == map['fulfillmentstatus']) ??
          Fulfillmentstatus.values[0],
      paymentstatus: Paymentstatus.values.firstWhereOrNull(
              (element) => element.name == map['paymentstatus']) ??
          Paymentstatus.values[0],
    );
  }
}

enum Fulfillmentstatus {
  unknown,
  creating,
  submitted,
  sent,
  received,
  processing,
  ready,
  complete,
  userCancelled,
  vendorCancelled,
}

enum Paymentstatus {
  unknown,
  paid,
  refunded,
  unpaid,
}
