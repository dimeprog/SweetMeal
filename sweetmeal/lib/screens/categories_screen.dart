import 'package:flutter/material.dart';
import './category_item.dart';
import '../models/dummy_data.dart';

class CatagoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SweetMeal'),
      ),
      body: GridView(
          padding: const EdgeInsets.all(10),
          children: DUMMY_CATEGORIES
              .map((catData) => CategoryItem(
                    id: catData.id,
                    title: catData.title,
                    color: catData.color,
                  ))
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          )),
    );
  }
}
