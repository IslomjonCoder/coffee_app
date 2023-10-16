import 'package:coffee_app_user/data/models/coffee_model.dart';
import 'package:coffee_app_user/presentation/screens/coffee_detail_screen.dart';
import 'package:coffee_app_user/presentation/screens/tab_box/tab_box_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String tabBox = "/";
  static const String detail = "/detail";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.detail:
        return MaterialPageRoute(
            builder: (context) => CoffeeDetailScreen(coffee: settings.arguments as Coffee));
      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (context) => const TabBoxScreen());
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
