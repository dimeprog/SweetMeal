import 'package:flutter/material.dart';
import './category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final Color color;
  final String title;
  CategoryItem({
    required this.id,
    required this.title,
    required this.color,
  });

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/category_meal', arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(20),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoCondensed',
              fontSize: 20),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
      ),
    );
  }
}
