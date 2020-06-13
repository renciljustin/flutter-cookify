import 'package:cookify/models/category.dart';
import 'package:cookify/screens/category/meals_category_screen.dart';
import 'package:flutter/material.dart';

class CategoryData extends StatelessWidget {
  final Category category;

  CategoryData(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigatetoMealCategory(context),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
              colors: [category.color.withOpacity(0.7), category.color],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }

  _navigatetoMealCategory(BuildContext context) {
    Navigator.pushNamed(context, MealsCategoryScreen.ROUTE_NAME, arguments: category);
  }
}
