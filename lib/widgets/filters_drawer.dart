import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:meals_refactored/providers/filters_provider.dart';

class FiltersDrawer extends ConsumerWidget {
  const FiltersDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filters = ref.watch(filtersProvider);

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 48, 16, 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 16),
                Text('Filters',
                    style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Gluten Free'),
            subtitle: const Text('Only include gluten free meals.'),
            value: filters['glutenFree']!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).setFilter('glutenFree', value);
            },
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Lavtose Free'),
            subtitle: const Text('Only include lactose free meals.'),
            value: filters['lactoseFree']!,
            onChanged: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter('lactoseFree', value);
            },
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Vegetarian'),
            subtitle: const Text('Only include Vegetarian meals.'),
            value: filters['vegetarian']!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).setFilter('vegetarian', value);
            },
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Vegan'),
            subtitle: const Text('Only include vegan meals.'),
            value: filters['vegan']!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).setFilter('vegan', value);
            },
          ),
        ],
      ),
    );
  }
}
