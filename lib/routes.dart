import 'package:flutter/material.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/presentation/pages/add_revenue_screen.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/presentation/pages/revenue_screen.dart';

class RoutePaths {
  static const String revenueScreen = 'revenue_screen';
  static const String addRvenueScreen = 'add_revenue_screen';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.revenueScreen:
        return MaterialPageRoute(builder: (_) => const RevenueScreen());
      case RoutePaths.addRvenueScreen:
        return MaterialPageRoute(builder: (_) => const AddRevenueScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
