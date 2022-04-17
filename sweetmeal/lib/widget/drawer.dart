import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildDrawerLink(String title, IconData icon, Function() tapHandler) {
    return Container(
      child: ListTile(
        leading: Icon(
          icon,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: tapHandler,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 100,
          alignment: Alignment.center,
          color: Colors.yellowAccent,
          child: const Text(
            'Cook Up!!!!',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        _buildDrawerLink(
          'Meal',
          Icons.restaurant,
          () => Navigator.of(context).pop(),
        ),
        _buildDrawerLink(
          'Filter',
          Icons.filter,
          () => Navigator.of(context).pushNamed(
            FilterScreen.routeName,
          ),
        ),
      ]),
    );
  }
}
