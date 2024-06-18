import 'package:flutter/material.dart';
import 'package:gridview_demo/gridview_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: GridviewDemo(), debugShowCheckedModeBanner: false);
  }
}
