import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersNotifier extends StateNotifier<Map<String, bool>> {
  FiltersNotifier()
      : super(
          {
            'glutenFree': false,
            'lactoseFree': false,
            'vegetarian': false,
            'vegan': false,
          },
        );

  void setFilter(String filter, bool value) {
    state = {
      ...state,
      filter: value,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<String, bool>>(
  (ref) => FiltersNotifier(),
);
