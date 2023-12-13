import 'package:flutter/material.dart';
import 'package:learning_flutter/app.dart';

void main() {
  runApp(MaterialApp(
    title: "learnings",
    darkTheme: ThemeData.dark(useMaterial3: true),
    themeMode: ThemeMode.system,
    home: const App(),
  ));
}
