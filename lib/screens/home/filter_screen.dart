import 'package:cookify/models/meal_filter.dart';
import 'package:cookify/screens/home/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/filters';

  final List<MealFilter> currentFilters;
  final Function updateFilters;

  FilterScreen(this.currentFilters, this.updateFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<MealFilter> _filters = [];

  @override
  void initState() {
    _filters.addAll(widget.currentFilters);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.updateFilters(_filters);
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: _filters.map(_buildSwitchListTile).toList(),
      ),
    );
  }

  SwitchListTile _buildSwitchListTile(MealFilter filter) {
    return SwitchListTile(
        title: Text(filter.name),
        subtitle: Text(filter.description),
        value: filter.isSelected,
        onChanged: (value) {
          setState(() {
            filter.isSelected = value;
          });
        });
  }
}
