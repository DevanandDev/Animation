import 'package:animation_demo/animation.dart';
import 'package:animation_demo/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 void main()
 {
  runApp(ChangeNotifierProvider(
    create: (context) => ListProvider(),
    child: MyApp()));
 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAnimation(),
    );
  }
}