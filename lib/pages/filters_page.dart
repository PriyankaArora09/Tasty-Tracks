import 'package:flutter/material.dart';
import '../models/meal.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersPage extends StatefulWidget {
  const FiltersPage({Key? key, required this.currentFilters}) : super(key: key);

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _onGlutenFreeChecked = false;
  var _onLactoseFreeChecked = false;
  var _onVegetarianChecked = false;
  var _onVeganChecked = false;

  @override
  void initState() {
    super.initState();
    _onGlutenFreeChecked = widget.currentFilters[Filter.glutenFree]!;
    _onLactoseFreeChecked = widget.currentFilters[Filter.lactoseFree]!;
    _onVegetarianChecked = widget.currentFilters[Filter.vegetarian]!;
    _onVeganChecked = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectPage: (identifier) {
      //     Navigator.pop(context);
      //     if (identifier == 'meals') {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (ctx) => CategoryPage(
      //               onToggleFavourite: widget.onToggleFavourite,
      //             ),
      //           ));
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _onGlutenFreeChecked,
            Filter.lactoseFree: _onLactoseFreeChecked,
            Filter.vegetarian: _onVegetarianChecked,
            Filter.vegan: _onVeganChecked,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _onGlutenFreeChecked,
              onChanged: (itemChecked) {
                setState(() {
                  _onGlutenFreeChecked = itemChecked;
                });
              },
              title: Text(
                'Glutten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'It will contain the recipes which are glutten free only.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _onLactoseFreeChecked,
              onChanged: (itemChecked) {
                setState(() {
                  _onLactoseFreeChecked = itemChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'It will contain the recipes which are lactose free only.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _onVegetarianChecked,
              onChanged: (itemChecked) {
                setState(() {
                  _onVegetarianChecked = itemChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'It will contain the recipes which are vegetarian only.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _onVeganChecked,
              onChanged: (itemChecked) {
                setState(() {
                  _onVeganChecked = itemChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'It will contain the recipes which are vegan only.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
