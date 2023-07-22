
import 'package:flutter/material.dart';
import 'package:tasty_tracks/pages/meals_page.dart';
import 'package:tasty_tracks/widgets/category_grid_item.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, required this.onToggleFavourite, required this.availableMeals}) : super(key: key);

  final void Function(Meal meal) onToggleFavourite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsPage(
                title: category.title,
                meals: filteredMeals,
              onToggleFavourite: onToggleFavourite,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose your category'),
      ),
      body: GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
