import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  Widget _buildListSection(child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent.shade100,
          border: Border.all(
            color: Colors.lightBlue.shade200,
          ),
          borderRadius: BorderRadius.circular(
            15,
          )),
      height: 180,
      child: child,
    );
  }

  Widget _buildTitleHeader(String header) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        header,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.pinkAccent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final ingredientsListView = ListView.builder(
      itemBuilder: (conent, index) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              selectedMeal.ingredients[index],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        );
      },
      itemCount: selectedMeal.ingredients.length,
    );
    //

    final stepsListView = ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text('${index + 1}'),
            backgroundColor: const Color.fromARGB(255, 243, 143, 176),
          ),
          title: Text(selectedMeal.steps[index]),
        );
      },
      itemCount: selectedMeal.steps.length,
    );
    //

    //  ////////////////////////////////////////

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildTitleHeader('INGREDIENT'),
            _buildListSection(ingredientsListView),
            _buildTitleHeader('STEPS'),
            _buildListSection(stepsListView),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).errorColor,
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
