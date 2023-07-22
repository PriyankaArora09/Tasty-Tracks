import 'package:flutter/material.dart';
import 'package:tasty_tracks/pages/meal_details_page.dart';
import 'package:tasty_tracks/widgets/meal_item.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';

class MealsPage extends StatelessWidget {
  const MealsPage(
      {Key? key,
      required this.onToggleFavourite,
      this.title,
      required this.meals})
      : super(key: key);

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavourite;

  void _selectMealItem(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => MealDetailsPage(
            meal: meal,
            onToggleFavourite: onToggleFavourite,
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh.... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting some other category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMealItem: (meal) {
            _selectMealItem(context, meal);
          },
        ),
      );
    }
    if(title == null){
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
