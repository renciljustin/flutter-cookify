import 'package:cookify/data/dummy_data.dart';
import 'package:cookify/models/meal_filter.dart';
import 'package:cookify/screens/category/meal_details_screen.dart';
import 'package:cookify/screens/category/meals_category_screen.dart';
import 'package:cookify/screens/home/filter_screen.dart';
import 'package:cookify/screens/home/main_tab.dart';
import 'package:cookify/utils/utils.dart';
import 'package:flutter/material.dart';

import 'models/meal.dart';

main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<MealFilter> _mealFilters = [];

  @override
  void initState() {
    _mealFilters.addAll(<MealFilter>[
      MealFilter('Glutten Free', 'Lorem ipsum dolor sit amet.', false),
      MealFilter('Vegan', 'Lorem ipsum dolor sit amet.', false),
      MealFilter('Vegetarian', 'Lorem ipsum dolor sit amet.', false),
      MealFilter('Lactose Free', 'Lorem ipsum dolor sit amet.', false),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Utils.customTheme,
      routes: {
        '/': (_) => TabsScreen(),
        MealsCategoryScreen.ROUTE_NAME: (_) => MealsCategoryScreen(meals),
        MealDetailsScreen.ROUTE_NAME: (_) => MealDetailsScreen(),
        FilterScreen.ROUTE_NAME: (_) => FilterScreen(_mealFilters, _updateFilters),
      },
      initialRoute: '/',
    );
  }

  List<Meal> get meals {
    return DUMMY_MEALS.where((meal) {
      if (_mealFilters[0].isSelected && !meal.isGlutenFree) return false;
      if (_mealFilters[1].isSelected && !meal.isVegan) return false;
      if (_mealFilters[2].isSelected && !meal.isVegetarian) return false;
      if (_mealFilters[3].isSelected && !meal.isLactoseFree) return false;
      return true;
    }).toList();
  }

  void _updateFilters(List<MealFilter> newMealFilters) {
    setState(() {
      _mealFilters = newMealFilters;
    });
  }
}
