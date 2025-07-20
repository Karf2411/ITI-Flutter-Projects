import 'package:flutter/material.dart';
import 'package:manage_tasks/Core/utils/routes.dart';
import 'package:manage_tasks/Core/utils/cash_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.router,
    );
  }
}
