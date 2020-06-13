import 'package:cookify/data/dummy_data.dart';
import 'package:flutter/material.dart';

import 'category_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          maxCrossAxisExtent: 200.0,
        ),
        children: DUMMY_CATEGORIES.map((e) => CategoryData(e)).toList(),
      ),
    );
  }
}
