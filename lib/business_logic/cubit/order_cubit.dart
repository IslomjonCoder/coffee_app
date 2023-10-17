import 'package:coffee_app_user/data/models/order_model.dart';
import 'package:coffee_app_user/data/models/order_model_firebase.dart';
import 'package:coffee_app_user/data/service/order_service_admin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Cubit<List<OrderModelFirebase>> {
  final OrderService _orderService = OrderService();

  OrderBloc() : super([]) {
    _orderService.getOrderStream().listen(emit);
  }
}
