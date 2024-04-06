import 'package:flutter/material.dart';
import 'package:meals_refactored/models/category.dart';
import 'package:meals_refactored/screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category, {super.key});

  final Category category;

  @override
  Widget build(context) {
    final width = category.id == 'c0'
        ? double.infinity
        : (MediaQuery.sizeOf(context).width - 32) / 2;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) {
              return MealsScreen(category);
            },
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 165,
        width: width,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(.5),
              category.color.withOpacity(.8)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
