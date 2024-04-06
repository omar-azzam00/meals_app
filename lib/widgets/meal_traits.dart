import 'package:flutter/material.dart';
import 'package:meals_refactored/models/meal.dart';
import 'meal_item_trait.dart';

class MealTraits extends StatelessWidget {
  const MealTraits(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(context) {
    return Row(
      children: [
        MealItemTrait(meal.complexity),
        const SizedBox(width: 8),
        MealItemTrait(meal.affordability),
        const Spacer(),
        const Icon(
          Icons.schedule,
          color: Colors.white70,
        ),
        const SizedBox(width: 4),
        Text('${meal.duration} min'),
      ],
    );
  }
}
