import 'package:flutter/material.dart';
import 'package:sweetmeal/models/category.dart';
import '../widget/meal_item.dart';
import '../models/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category_meal';
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
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(CategoryId);
    }).toList();
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
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              affordability: categoryMeal[index].affordability,
              complexity: categoryMeal[index].complexity,
              duration: categoryMeal[index].duration,
              imageUrl: categoryMeal[index].imageUrl,
              title: categoryMeal[index].title,
            );
          },
          itemCount: categoryMeal.length,
        ));
  }
}
