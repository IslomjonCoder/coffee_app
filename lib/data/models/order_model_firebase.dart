import 'package:coffee_app_user/data/models/coffee_model.dart';

class OrderModelFirabase {
  final String location;
  final String phoneNumber;
  final List<Coffee> orderItems;

  OrderModelFirabase({
    required this.location,
    required this.phoneNumber,
    required this.orderItems,
  });
}
