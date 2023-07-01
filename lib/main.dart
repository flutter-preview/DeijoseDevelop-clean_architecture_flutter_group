import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_project/src/ui/routes/app_pages.dart';
import 'package:task_project/src/ui/routes/app_routes.dart';
import 'package:task_project/src/utils/u_injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Injector.dependencies,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: HomePage(),
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppPages.routes,
    );
  }
}
