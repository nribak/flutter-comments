import 'package:flutter/material.dart';
import 'package:learning_flutter/app_menu.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Menu")),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: AppMenuItem.items.map((item) {
            return ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, item.routeName),
                child: Text(item.title)
            );
          }).toList(growable: false),
        ),
      ),
    );
  }
}