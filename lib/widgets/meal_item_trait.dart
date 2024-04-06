import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait(this.theEnum, {super.key});

  final Enum theEnum;

  @override
  Widget build(BuildContext context) {
    var color = Colors.green;

    if (theEnum.index == 1) {
      color = Colors.orange;
    } else if (theEnum.index > 1) {
      color = Colors.deepOrange;
    }

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(64),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(theEnum.name),
    );
  }
}
