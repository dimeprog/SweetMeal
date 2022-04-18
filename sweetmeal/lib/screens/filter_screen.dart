import 'package:flutter/material.dart';
import 'package:sweetmeal/widget/drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/flterScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filter'),
      ),
      drawer: MainDrawer(),
      body: const Center(
        child: Text('Filter'),
      ),
    );
  }
}
