import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app_user/data/models/order_model_firebase.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<OrderModelFirebase>> getOrderStream() {
    return _firestore.collection('orders').snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) => OrderModelFirebase.fromJson(doc.data())).toList();
    });
  }
}
