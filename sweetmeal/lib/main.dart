import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sweetmeal/models/meal.dart';
import './models/dummy_data.dart';
import './screens/filter_screen.dart';
import 'package:sweetmeal/screens/tabs_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/favourite_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  List<Meal> _availableMeals = DUMMY_MEALS;
  // making filters
  Map _filters = {
    'gluten': false,
    'Lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> isFavourite = [];

  void _setFilter(Map _filterData) {
    setState(() {
      _filters = _filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['Lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    final existingIndex = isFavourite.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        isFavourite.removeAt(existingIndex);
      });
    } else {
      setState(() {
        isFavourite.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavourite(String id) {
    return isFavourite.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SweetMeal',

      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        // colorScheme: ColorScheme.fromSwatch(
        //   primarySwatch: Colors.pink,
        // ).copyWith(
        //   secondary: Colors.amber,
        // ),
        // textTheme: TextTheme(
        //   bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        //   bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        //   titleMedium: const TextStyle(
        //     fontFamily: 'RobotoCondensed',
        //     fontSize: 20,
        //   ),
        // ),
        // typography: Typography(
        //   white: TextTheme(
        //     bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        //     bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        //     titleMedium: const TextStyle(
        //       fontFamily: 'RobotoCondensed',
        //       fontSize: 20,
        //     ),
        //   ),
        // ),
      ),
      // home: CatagoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(isFavourite),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
              isMealFavourite: isMealFavourite,
              toggleFavourite: toggleFavourite,
            ),
        FilterScreen.routeName: (context) => FilterScreen(_setFilter),
      },
    );
  }
}
