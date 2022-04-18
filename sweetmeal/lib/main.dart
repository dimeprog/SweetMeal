import 'package:flutter/material.dart';
import './screens/filter_screen.dart';
import 'package:sweetmeal/screens/tabs_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/favourite_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
        '/': (context) => TabsScreen(),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilterScreen.routeName: (context) => FilterScreen(),
      },
    );
  }
}
