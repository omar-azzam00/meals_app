import 'package:flutter/material.dart';

class MealBoolTrait extends StatelessWidget {
  const MealBoolTrait(this.title, {super.key});

  final String title;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(64),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(title),
    );
  }
}
