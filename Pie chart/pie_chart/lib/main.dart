import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPieChart(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyPieChart extends StatefulWidget {
  const MyPieChart({super.key});
  @override
  State createState() => _MyPieChartState();
}

class _MyPieChartState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Ranks"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
