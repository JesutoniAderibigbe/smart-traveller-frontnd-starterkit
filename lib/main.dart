import 'package:flutter/material.dart';
import 'package:smart_travller_frontend_starter/src/constants/app_theme.dart';
import 'package:smart_travller_frontend_starter/src/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: appTheme,

      routerConfig: Routes.routes,
    );
  }
}
