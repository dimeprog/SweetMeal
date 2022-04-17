import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          child: const Text(
            'Cook Up!!!!1',
            style: TextStyle(
              color: Colors.pinkAccent,
            ),
          ),
        ),
      ]),
    );
  }
}
