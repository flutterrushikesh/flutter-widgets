import 'package:flutter/material.dart';

class GridviewDemo extends StatelessWidget {
  const GridviewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gridview demo"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: Text("$index+1"),
            );
          }),
    );
  }
}
