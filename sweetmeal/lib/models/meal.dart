// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum Complexity { Simple, Challenging, Hard }
enum Affordibility { Cheap, Pricey, Expensive }

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordibility affordibility;
  final bool isGleunFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.complexity,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.affordibility,
    required this.isGleunFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
