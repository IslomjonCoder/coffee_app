import 'package:coffee_app_user/data/models/order_model.dart';

class OrderModelFirebase {
  final String location;
  final String phoneNumber;
  final List<Order> orderItems;

  OrderModelFirebase({
    required this.location,
    required this.phoneNumber,
    required this.orderItems,
  });

  toJson() {
    return {
      'location': location,
      'phoneNumber': phoneNumber,
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModelFirebase.fromJson(Map<String, dynamic> map) {
    return OrderModelFirebase(
      location: map['location'] as String,
      phoneNumber: map['phoneNumber'] as String,
      orderItems: (map['orderItems'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
