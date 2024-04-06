import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_refactored/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toggleFavourite(Meal meal) {
    var holder = List.of(state);

    if (holder.contains(meal)) {
      holder.remove(meal);
      state = holder;
      return false;
    } else {
      holder.add(meal);
      state = holder;
      return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>(
  (ref) => FavouriteMealsNotifier(),
);
