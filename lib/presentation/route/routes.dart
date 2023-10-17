import 'package:coffee_app_user/data/models/coffee_model.dart';
import 'package:coffee_app_user/presentation/screens/coffee_detail_screen.dart';
import 'package:coffee_app_user/presentation/screens/order_screen_admin.dart';
import 'package:coffee_app_user/presentation/screens/tab_box/screens/order_screen.dart';
import 'package:coffee_app_user/presentation/screens/tab_box/tab_box_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String orders = "/";
  static const String detail = "/detail";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.orders:
        return MaterialPageRoute(builder: (context) => OrderScreen());
    }
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text("Route not found"),
        ),
      ),
    );
  }
}
