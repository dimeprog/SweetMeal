import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> isFavourite;
  FavouriteScreen(this.isFavourite);

  @override
  Widget build(BuildContext context) {
    return isFavourite.isEmpty
        ? const Center(
            child: Text(
              'There is no favourite',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            itemCount: isFavourite.length,
            itemBuilder: (context, index) {
              return MealItem(
                id: isFavourite[index].id,
                affordability: isFavourite[index].affordability,
                complexity: isFavourite[index].complexity,
                duration: isFavourite[index].duration,
                imageUrl: isFavourite[index].imageUrl,
                title: isFavourite[index].title,
              );
            },
          );
  }
}
