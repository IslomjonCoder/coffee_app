import 'package:coffee_app_user/business_logic/bloc/local_order_bloc/order_bloc.dart';
import 'package:coffee_app_user/business_logic/bloc/remote_order_bloc/remote_order_bloc.dart';
import 'package:coffee_app_user/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:coffee_app_user/business_logic/cubit/category_cubit/category_cubit.dart';
import 'package:coffee_app_user/business_logic/cubit/size_cubit/size_cubit.dart';
import 'package:coffee_app_user/business_logic/cubit/tab_box_cubit/tab_box_cubit.dart';
import 'package:coffee_app_user/data/models/coffee_model.dart';
import 'package:coffee_app_user/data/models/order_model.dart';
import 'package:coffee_app_user/data/service/order_service.dart';
import 'package:coffee_app_user/presentation/route/routes.dart';
import 'package:coffee_app_user/presentation/utils/fonts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive
    ..registerAdapter(CoffeeAdapter()) // Register the CoffeeAdapter.
    ..registerAdapter(OrderAdapter());
  await Hive.openBox<Order>('orders');
  await Hive.openBox<Coffee>('coffeeBox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabBoxCubit>(create: (context) => TabBoxCubit()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => SizeCubit()),
        BlocProvider(create: (context) => LocalOrderBloc()..add(GetOrders())),
        BlocProvider(create: (context) => AuthCubit()..checkCurrentUser()),
        BlocProvider(create: (context) => RemoteOrderBloc(OrderService())),
      ],
      child: MaterialApp(
        theme: FlexThemeData.light(
          scheme: FlexScheme.yellowM3,
        ),
        darkTheme: FlexThemeData.dark(
            scheme: FlexScheme.yellowM3,
            textTheme: TextTheme(
                titleLarge: DarkAppFonts.titleLarge,
                titleMedium: DarkAppFonts.titleMedium,
                titleSmall: DarkAppFonts.titleSmall,
                headlineSmall: DarkAppFonts.headlineSmall,
                bodyMedium: DarkAppFonts.bodyMedium,
                bodySmall: DarkAppFonts.bodySmall)),
        onGenerateRoute: AppRoutes.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
