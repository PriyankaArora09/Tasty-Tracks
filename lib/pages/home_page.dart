import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasty_tracks/data/dummy_data.dart';

import '../models/meal.dart';
import 'category_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.onToggleFavourite,
    required this.featuredMeal,
  }) : super(key: key);

  final void Function(Meal meal) onToggleFavourite;
  final List<Meal> featuredMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 38),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => CategoryPage(
                        onToggleFavourite: onToggleFavourite,
                        availableMeals: featuredMeal,
                    ),
                  ),
                );
              },
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
