import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_refactored/data/meals.dart';
import 'package:meals_refactored/models/meal.dart';
import 'package:meals_refactored/providers/favourite_meals_provider.dart';
import 'package:meals_refactored/widgets/meal_item.dart';
import 'package:meals_refactored/providers/filters_provider.dart';

class Meals extends ConsumerWidget {
  Meals(this.categoryId, {super.key});

  final String categoryId;
  final scrollController = ScrollController();

  bool passFilters(Map<String, bool> filters, Meal meal) {
    if (filters['glutenFree']! && !meal.isGlutenFree) {
      return false;
    }
    if (filters['lactoseFree']! && !meal.isLactoseFree) {
      return false;
    }
    if (filters['vegetarian']! && !meal.isVegetarian) {
      return false;
    }
    if (filters['vegan']! && !meal.isVegan) {
      return false;
    }

    return true;
  }

  @override
  Widget build(context, ref) {
    var filters = ref.watch(filtersProvider);

    Iterable<Meal> filteredMeals = categoryId != 'fav'
        ? meals.where(
            (meal) =>
                meal.categories.contains(categoryId) &&
                passFilters(filters, meal),
          )
        : ref.watch(favouriteMealsProvider).where(
              (meal) => passFilters(filters, meal),
            );

    return filteredMeals.isNotEmpty
        ? ListView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              for (int i = 0; i < filteredMeals.length; i++)
                MealItem(filteredMeals.elementAt(i), scrollController, i)
            ],
          )
        : Center(
            child: Text(
              'Uh oh! no meals here.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
  }
}
