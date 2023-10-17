import 'package:coffee_app_user/data/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Cubit<List<Order>> {
  final OrderService _orderService = OrderService();

  OrderBloc() : super([]) {
    _orderService.getOrderStream().listen((orders) {
      emit(orders);
    });
  }
}
