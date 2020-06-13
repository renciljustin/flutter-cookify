import 'package:cookify/screens/category/category_screen.dart';
import 'package:cookify/screens/favorites/FavoritesScreen.dart';
import 'package:cookify/screens/home/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedItem = 0;
  final List<Widget> _tabItems = [CategoryScreen(), FavoritesScreen()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cookify'),
        ),
        drawer: MainDrawer(),
        body: _tabItems[_selectedItem],
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItem,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          title: Text('Category'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          title: Text('Favorites'),
        ),
      ],
      onTap: _selectPage,
    );
  }

  _selectPage(int index) {
    setState(() {
      _selectedItem = index;
    });
  }
}
