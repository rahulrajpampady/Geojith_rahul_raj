
import 'package:flutter/material.dart';
import 'package:geojith/screens/home.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext)> get(BuildContext context) {
    return {
      HomeScreen.routeName: (context) => const HomeScreen(),
    };
  }
}
