import 'package:flutter/material.dart';
import 'package:meals_refactored/widgets/meals.dart';
import 'package:meals_refactored/models/category.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(this.category, {super.key});

  final Category category;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Meals(category.id),
    );
  }
}
