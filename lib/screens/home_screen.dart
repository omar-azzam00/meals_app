import 'package:flutter/material.dart';
import 'package:meals_refactored/widgets/categories.dart';
import 'package:meals_refactored/widgets/filters_drawer.dart';
import 'package:meals_refactored/widgets/meals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentPageIndex == 0 ? 'Categories' : 'Your Favourites'),
        automaticallyImplyLeading: currentPageIndex == 0,
        leading: currentPageIndex == 1
            ? IconButton(
                onPressed: () {
                  setState(
                    () {
                      currentPageIndex = 0;
                    },
                  );
                },
                icon: const Icon(Icons.arrow_back),
              )
            : Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      setState(
                        () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                    icon: const Icon(Icons.filter_list),
                  );
                },
              ),
      ),
      drawer: const FiltersDrawer(),
      drawerEnableOpenDragGesture: currentPageIndex == 0,
      body: currentPageIndex == 0 ? const Categories() : Meals('fav'),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Favourites',
            icon: Icon(Icons.star),
          ),
        ],
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(
            () {
              currentPageIndex = index;
            },
          );
        },
      ),
    );
  }
}
