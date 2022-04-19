import 'package:flutter/material.dart';
import 'package:sweetmeal/models/category.dart';
import 'package:sweetmeal/models/meal.dart';
import '../widget/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category_meal';
  final List<Meal> _availableMeals;

  CategoryMealScreen(this._availableMeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitle;
  List<Meal>? categoryMeal;
  var _loadinitData = false;
  @override
  void didChangeDependencies() {
    if (!_loadinitData) {
      final routesArgs = ModalRoute.of(context)?.settings.arguments as Map;
      categoryTitle = routesArgs['title'];
      final CategoryId = routesArgs['id'];
      categoryMeal = widget._availableMeals.where((meal) {
        return meal.categories.contains(CategoryId);
      }).toList();
      _loadinitData = true;
    }
    super.didChangeDependencies();
  }

  void remoteItem(String MealId) {
    setState(() {
      categoryMeal?.removeWhere((meal) => meal.id == MealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle!,
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
              remoteItem: remoteItem,
              id: categoryMeal![index].id,
              affordability: categoryMeal![index].affordability,
              complexity: categoryMeal![index].complexity,
              duration: categoryMeal![index].duration,
              imageUrl: categoryMeal![index].imageUrl,
              title: categoryMeal![index].title,
            );
          },
          itemCount: categoryMeal!.length,
        ));
  }
}
