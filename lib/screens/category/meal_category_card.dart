import 'package:cookify/models/meal.dart';
import 'package:cookify/screens/category/meal_details_screen.dart';
import 'package:flutter/material.dart';

class MealCategoryCard extends StatelessWidget {
  final Meal meal;

  MealCategoryCard(this.meal);

  navigateToMealDetail(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailsScreen.ROUTE_NAME,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToMealDetail(context),
      child: _buildCard(),
    );
  }

  Card _buildCard() {
    return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          _buildCardBanner(),
          _buildCardDetails(),
        ],
      ),
    );
  }

  Stack _buildCardBanner() {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(meal.imageUrl, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            width: 250.0,
            child: Text(
              meal.title,
              style: TextStyle(color: Colors.white, fontSize: 26.0),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ],
    );
  }

  Padding _buildCardDetails() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.schedule),
              SizedBox(width: 4.0),
              Text('${meal.duration} min'),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.work),
              SizedBox(width: 8.0),
              Text(meal.complexityText),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.attach_money),
              SizedBox(width: 8.0),
              Text(meal.affordabilityText),
            ],
          ),
        ],
      ),
    );
  }
}
