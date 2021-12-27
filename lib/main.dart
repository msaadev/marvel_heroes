import 'package:flutter/material.dart';
import 'package:marvel_heroes/core/navgation/routes.dart';
import 'package:marvel_heroes/view/home/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.black
      ),
      title: 'Marvel Heroes',
      onGenerateRoute: RouteGenerator.generateRoute,

    );
  }
}
