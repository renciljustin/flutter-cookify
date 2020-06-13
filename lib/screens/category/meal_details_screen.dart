import 'package:cookify/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/meals_category/meal_details';

  @override
  Widget build(BuildContext context) {
    var meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: <Widget>[
              buildMealImage(meal),
              buildSection(meal, context)
            ],
          ),
        ),
      ),
    );
  }

  ClipRRect buildMealImage(Meal meal) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(15.0),
      ),
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(meal.imageUrl, fit: BoxFit.cover),
          ),
          Positioned(
            bottom: -75,
            left: -75,
            child: Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: IconButton(
              icon: Icon(Icons.star_border),
              color: Colors.white,
              iconSize: 40,
              onPressed: () {},
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
      ),
    );
  }

  Column buildSection(Meal meal, BuildContext context) {
    return Column(
      children: <Widget>[
        buildRecipe(buildIngredients(meal, context), 'Ingredients', context),
        buildRecipe(buildSteps(meal, context), 'Steps', context),
      ],
    );
  }

  ListView buildIngredients(Meal meal, BuildContext context) {
    return ListView.builder(
      itemCount: meal.ingredients.length,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor.withAlpha(125),
            borderRadius: BorderRadius.circular(4.0),
          ),
          margin: const EdgeInsets.only(bottom: 4.0),
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Text(meal.ingredients[index]),
        );
      },
    );
  }

  ListView buildSteps(Meal meal, BuildContext context) {
    return ListView.builder(
      itemCount: meal.ingredients.length,
      itemBuilder: (_, index) {
        return Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor.withAlpha(125),
                  radius: 25.0,
                  child: Text('$index',
                      style: Theme.of(context).textTheme.subtitle1),
                ),
                SizedBox(width: 10.0),
                Text(meal.ingredients[index]),
              ],
            ),
            Divider(),
          ],
        );
      },
    );
  }

  Container buildRecipe(ListView listView, String title, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Divider(
                thickness: 4.0,
                indent: 50.0,
                endIndent: 50.0,
              ),
              Container(
                height: 200.0,
                width: double.infinity,
                child: listView,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
