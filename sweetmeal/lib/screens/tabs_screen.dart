import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sweetmeal/models/meal.dart';
import '../widget/drawer.dart';
import './categories_screen.dart';
import './favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> isFavourite;
  TabsScreen(this.isFavourite);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map> _page = [];

  @override
  initState() {
    _page = [
      {
        'page': CategoriesScreen(),
        'title': 'categories',
      },
      {
        'page': FavouriteScreen(widget.isFavourite),
        'title': ' Your favourite Meals',
      }
    ];
    super.initState();
  }

  int selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _page[selectedIndex]['title'],
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: _page[selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellowAccent,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.pinkAccent,
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.pinkAccent,
            icon: Icon(
              Icons.category,
            ),
            label: 'categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pinkAccent,
            icon: Icon(
              Icons.star,
            ),
            label: 'favourite',
          ),
        ],
      ),
    );
  }
}
