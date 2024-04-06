import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_refactored/providers/animated_once_provider.dart';
import 'package:meals_refactored/widgets/category_item.dart';
import 'package:meals_refactored/data/categories.dart';

class Categories extends ConsumerStatefulWidget {
  const Categories({super.key});

  @override
  ConsumerState<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends ConsumerState<Categories>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);

    if (ref.read(animatedOnceProvider)) {
      animationController.value = 1;
    } else {
      animationController.forward().then(
        (value) {
          ref.read(animatedOnceProvider.notifier).setAnimatedOnce();
        },
      );
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return SlideTransition(
                position: curvedAnimation.drive(
                  Tween(
                    begin: const Offset(0, 1),
                    end: const Offset(0, 0),
                  ),
                ),
                child: FadeTransition(
                  opacity: curvedAnimation,
                  child: child,
                ),
              );
            },
          );
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Wrap(
            runSpacing: 16,
            spacing: 16,
            children: [
              for (var category in categories) CategoryItem(category),
            ],
          ),
        ));
  }
}
