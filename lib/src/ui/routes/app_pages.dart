import 'package:flutter/material.dart';
import 'package:task_project/src/ui/pages/p_pages.dart';
import 'package:task_project/src/ui/routes/app_routes.dart';

class AppPages {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
