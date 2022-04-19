import 'package:flutter/material.dart';
import 'package:sweetmeal/widget/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/flterScreen';
  final Function saveFilter;
  FilterScreen(
    this.saveFilter,
  );

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegan = false;
  var isVegetarian = false;

  Widget _buildSwitchListTile(String title, String discriptionTitle,
      bool switchVale, Function(bool)? update) {
    return SwitchListTile(
      value: switchVale,
      onChanged: update,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        discriptionTitle,
        style: const TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Map setMap = {
    'gluten': false,
    'Lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filter Your Meal',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                final Map selectedFilter = {
                  'gluten': isGlutenFree,
                  'Lactose': isLactoseFree,
                  'vegan': isVegan,
                  'vegetarian': isVegetarian,
                };
                widget.saveFilter(selectedFilter);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              child: const Text(
                'Adjust Your Meal Selection',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                      'Gluten-Free',
                      'only include gluten free meals',
                      isGlutenFree, (newValue) {
                    setState(() {
                      isGlutenFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                    'Lactose-Free',
                    'only include Lactose free meals',
                    isLactoseFree,
                    (newValue) {
                      setState(() {
                        isLactoseFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                      'Vegan', 'only include vegan meals', isVegan, (newValue) {
                    setState(() {
                      isVegan = newValue;
                    });
                  }),
                  _buildSwitchListTile('Vegetarian',
                      'only include vetegable meals', isVegetarian, (newValue) {
                    setState(() {
                      isVegetarian = newValue;
                    });
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
