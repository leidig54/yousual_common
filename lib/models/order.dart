import 'package:yousual_common/models/item.dart';

class Order {
  String orderId;
  String userId;
  String userName;
  String vendorId;
  String vendorName;
  List<Item> items;
  double price;
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
    required this.price,
    required this.createdDateTime,
    this.receivedDateTime,
    this.processingDateTime,
    this.readyDateTime,
    this.completeDateTime,
    this.status = Status.creating,
  });

  Order copyWith({
    String? orderId,
    String? userId,
    String? userName,
    String? vendorId,
    String? vendorName,
    List<Item>? items,
    double? price,
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
      price: price ?? this.price,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      receivedDateTime: receivedDateTime ?? this.receivedDateTime,
      processingDateTime: processingDateTime ?? this.processingDateTime,
      readyDateTime: readyDateTime ?? this.readyDateTime,
      completeDateTime: completeDateTime ?? this.completeDateTime,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'userId': userId,
      'userName': userName,
      'vendorId': vendorId,
      'vendorName': vendorName,
      'items': items.map((x) => x.toMap()).toList(),
      'price': price,
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
      orderId: map['orderId'] ?? '',
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      vendorId: map['vendorId'] ?? '',
      vendorName: map['vendorName'] ?? '',
      items: List<Item>.from(
          map['items']?.map((x) => Item.fromMap(x)) ?? const []),
      price: map['price']?.toDouble() ?? 0.0,
      createdDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['createdDateTime']),
      receivedDateTime: map['receivedDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['receivedDateTime'])
          : null,
      processingDateTime: map['processingDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['processingDateTime'])
          : null,
      readyDateTime: map['readyDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['readyDateTime'])
          : null,
      completeDateTime: map['completeDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['completeDateTime'])
          : null,
      status: Status.values[map['status'] ?? 0],
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
