import 'package:flutter/material.dart';

class Leaf_Scan extends StatelessWidget {
  const Leaf_Scan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 180, 245, 183),
      child: const Center(
        child: Text(
          "Scan the leaf",
        ),
      ),
    );
  }
}
