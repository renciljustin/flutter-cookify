import 'package:cookify/constants/fontfamily_constant.dart';
import 'package:flutter/material.dart';

import 'filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: UserAccountsDrawerHeader(
              accountName: Text('Rencil Evangelista'),
              accountEmail: Text('rjevangelista@gmail.com'),
            ),
          ),
          _buildDrawerItem(
            context,
            'categories',
            Icons.category,
            '/',
          ),
          _buildDrawerItem(
            context,
            'filters',
            Icons.settings,
            FilterScreen.ROUTE_NAME,
          ),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(
      BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.subtitle2.copyWith(
              fontFamily: FontFamilyConstant.ROBOTO_CONDENSED,
              fontSize: 18.0,
            ),
      ),
      onTap: () => _navigateTo(context, route),
    );
  }

  void _navigateTo(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }
}
