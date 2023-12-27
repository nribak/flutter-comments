import 'package:flutter/material.dart';
import 'package:learning_flutter/app_menu.dart';
import 'package:learning_flutter/exchange/di/di_injector.dart';
import 'package:learning_flutter/extensions.dart';

void main() {
  configureDependencies();
  runApp(MaterialApp(
    title: "learnings",
    darkTheme: ThemeData.dark(useMaterial3: true),
    themeMode: ThemeMode.system,
    initialRoute: AppMenuItem.home.routeName,
    routes: AppMenuItem.routes.toMap(
        keys: (el) => el.routeName,
        values: (el) => el.builder
    )
  ));
}
