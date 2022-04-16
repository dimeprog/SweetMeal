import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem(
      {required this.affordability,
      required this.complexity,
      required this.duration,
      required this.imageUrl,
      required this.title});

  void selectMeal() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(children: [
          Stack(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl,
                height: 250,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            )
          ]),
        ]),
      ),
      onTap: selectMeal,
    );
  }
}
