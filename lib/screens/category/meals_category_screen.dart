import 'package:cookify/models/category.dart';
import 'package:cookify/models/meal.dart';
import 'package:cookify/screens/category/meal_category_card.dart';
import 'package:flutter/material.dart';

class MealsCategoryScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/meals_category';

  final List<Meal> meals;

  MealsCategoryScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    var category = ModalRoute.of(context).settings.arguments as Category;
    var _mealsByCategory = meals.where((o) => o.categories.contains(category.id) ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: _mealsByCategory.length,
        itemBuilder: (_, index) {
          return MealCategoryCard(_mealsByCategory[index]);
        },
      ),
    );
  }
}
