import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:meals_refactored/data/categories.dart';
import 'package:meals_refactored/models/meal.dart';
import 'package:meals_refactored/providers/favourite_meals_provider.dart';
import 'package:meals_refactored/widgets/meal_bool_trait.dart';
import 'package:meals_refactored/widgets/meal_traits.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen(this.meal, {super.key});

  final Meal meal;

  String get categoriesText {
    var mealCategoriesIds = List.of(meal.categories);
    mealCategoriesIds.remove('c0');
    return categories
        .where(
          (category) => mealCategoriesIds.contains(category.id),
        )
        .map(
          (category) => category.title,
        )
        .join(', ');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFavourite = ref.watch(favouriteMealsProvider).contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favouriteMealsProvider.notifier).toggleFavourite(meal);
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              layoutBuilder: (currentChild, previousChildren) {
                return currentChild!;
              },
              switchInCurve: Curves.decelerate,
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(begin: .8, end: 1.0).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFavourite ? Icons.star : Icons.star_outline,
                key: ValueKey(isFavourite),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Hero(
            tag: meal.id,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: meal.imageUrl,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  categoriesText,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                MealTraits(meal),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (meal.isGlutenFree) const MealBoolTrait('Gluten Free'),
                    if (meal.isLactoseFree) const MealBoolTrait('Lactose Free'),
                    if (meal.isVegetarian) const MealBoolTrait('Vegetarian'),
                    if (meal.isVegan) const MealBoolTrait('Vegan'),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  'What do you need :',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  meal.ingredients.join('\n'),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Steps :',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  meal.steps.join('\n'),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
