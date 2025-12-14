import 'package:flutter/material.dart';

class ThemeTrying extends StatelessWidget {
  const ThemeTrying({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Theme Trying"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: "Theme Trying",
            hintText: "Theme Trying",
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Cart',
            ),
      ]),
    );
  }
}
