// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yousual_common/models/item.dart';

class Order {
  String orderId;
  String userId;
  String userName;
  String vendorId;
  String vendorName;
  List<Item> items;
  DateTime createdDateTime;
  DateTime? receivedDateTime;
  DateTime? processingDateTime;
  DateTime? readyDateTime;
  DateTime? completeDateTime;
  // enum
  Status status;
  Order({
    required this.orderId,
    required this.userId,
    required this.userName,
    required this.vendorId,
    required this.vendorName,
    this.items = const [],
    required this.createdDateTime,
    this.receivedDateTime,
    this.processingDateTime,
    this.readyDateTime,
    this.completeDateTime,
    this.status = Status.creating,
  });

  double get price {
    double standingPrice = 0;
    for (Item item in items) {
      standingPrice += item.price;
    }
    return standingPrice;
  }

  Order copyWith({
    String? orderId,
    String? userId,
    String? userName,
    String? vendorId,
    String? vendorName,
    List<Item>? items,
    DateTime? createdDateTime,
    DateTime? receivedDateTime,
    DateTime? processingDateTime,
    DateTime? readyDateTime,
    DateTime? completeDateTime,
    Status? status,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      vendorId: vendorId ?? this.vendorId,
      vendorName: vendorName ?? this.vendorName,
      items: items ?? this.items,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      receivedDateTime: receivedDateTime ?? this.receivedDateTime,
      processingDateTime: processingDateTime ?? this.processingDateTime,
      readyDateTime: readyDateTime ?? this.readyDateTime,
      completeDateTime: completeDateTime ?? this.completeDateTime,
      status: status ?? this.status,
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
      'receivedDateTime': receivedDateTime?.millisecondsSinceEpoch,
      'processingDateTime': processingDateTime?.millisecondsSinceEpoch,
      'readyDateTime': readyDateTime?.millisecondsSinceEpoch,
      'completeDateTime': completeDateTime?.millisecondsSinceEpoch,
      'status': status.index,
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
        (map['items'] as List<int>).map<Item>(
          (x) => Item.fromMap(x as Map<String, dynamic>),
        ),
      ),
      createdDateTime: DateTime.fromMillisecondsSinceEpoch(
          (map['createdDateTime'] ?? 0) as int),
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
      status: Status.values[(map['status'] ?? 0) as int],
    );
  }
}

enum Status {
  creating,
  paid,
  received,
  processing,
  ready,
  complete,
}
