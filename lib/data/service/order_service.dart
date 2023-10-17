import 'package:coffee_app_user/data/models/order_model_firebase.dart';
import 'package:coffee_app_user/data/models/result_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app_user/data/models/order_model.dart';

class OrderService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Result> placeOrder(OrderModelFirabase order) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        // Get the user's UID
        final userId = user.uid;

        // Store the order in a "orders" collection
        await _firestore.collection('orders').add({
          'userId': userId,
          'location': order.location,
          'phoneNumber': order.phoneNumber,
          'orderItems': order.orderItems.map((item) => item.toMap()).toList(),
          'timestamp': FieldValue.serverTimestamp(),
        });
        return Result.success(null);
      }
      return Result.fail('User not authenticated');
    } catch (e) {
      return Result.fail(e.toString());
    }
  }
}
