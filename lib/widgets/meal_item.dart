import 'package:flutter/material.dart';
import 'package:meals_refactored/models/meal.dart';
import 'package:meals_refactored/screens/meal_details_screen.dart';
import 'package:transparent_image/transparent_image.dart';
import 'meal_traits.dart';

class MealItem extends StatelessWidget {
  const MealItem(this.meal, this.scrollController, this.index, {super.key});

  final Meal meal;
  final ScrollController scrollController;
  final int index;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          scrollController
              .animateTo(
            index * 250 + index * 16 + 8,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          )
              .then(
            (value) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => MealDetailsScreen(meal),
                ),
              );
            },
          );
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: meal.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white.withOpacity(.9),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    MealTraits(meal),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
