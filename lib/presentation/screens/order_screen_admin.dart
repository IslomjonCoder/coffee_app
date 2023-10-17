import 'package:coffee_app_user/business_logic/cubit/order_cubit.dart';
import 'package:coffee_app_user/data/models/order_model_firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: BlocBuilder<OrderBloc, List<OrderModelFirebase>>(
        builder: (context, orders) {
          if (orders.isEmpty) {
            return Text('No orders available');
          } else {
            // Display orders or perform other operations with 'orders'
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                // Use 'order' to display order details
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Location: ${order.location}'),
                      Text('Phone Number: ${order.phoneNumber}'),
                      SizedBox(height: 16),
                      Text('Order Items:'),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: order.orderItems.length,
                        itemBuilder: (context, index) {
                          final orderItem = order.orderItems[index];
                          return ListTile(
                            leading: Image.network(orderItem.coffee.imagePath),
                            title: Text(orderItem.coffee.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Quantity: ${orderItem.quantity}'),
                                Text('Size: ${orderItem.coffee.size}'),
                                Text('Price: \$${orderItem.coffee.price}'),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
