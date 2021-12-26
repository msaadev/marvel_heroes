import 'package:flutter/material.dart';
import 'package:marvel_heroes/view/home/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      title: 'Marvel Heroes',
      home: const HomeView(),
    );
  }
}
