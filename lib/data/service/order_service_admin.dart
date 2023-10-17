import 'package:coffee_app_user/data/models/order_model_firebase.dart';

class OrderServiceAdmin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Order>> getOrderStream() {
    return _firestore.collection('orders').snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) => OrderModelFirabase.fromJson(doc)).toList();
    });
  }
}
