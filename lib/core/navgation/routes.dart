import 'package:flutter/material.dart';
import 'package:marvel_heroes/view/hero/view/character_view.dart';
import 'package:marvel_heroes/view/home/view/home_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      default :
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
