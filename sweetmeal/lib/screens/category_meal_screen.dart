import 'package:flutter/material.dart';
import 'package:sweetmeal/models/category.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealScreen({
  //   required this.categoryId,
  //   required this.categoryTitle,
  // });
  @override
  Widget build(BuildContext context) {
    final routesArgs = ModalRoute.of(context)?.settings.arguments as Map;
    final categoryTitle = routesArgs['title'];
    final CategoryId = routesArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
      body: const Center(
        child: Text('The meal is here'),
      ),
    );
  }
}
