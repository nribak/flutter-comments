import 'package:flutter/material.dart';
import 'package:learning_flutter/app.dart';
import 'package:learning_flutter/blog/widgets/blog_app.dart';
import 'package:learning_flutter/fibonacci/fibonacci_app.dart';

class AppMenuItem {
  final String title;
  final String routeName;
  final WidgetBuilder builder;

  const AppMenuItem({required this.title, required this.routeName, required this.builder});

  static final home = AppMenuItem(
      title: 'Main Menu',
      routeName: '/',
      builder: (_) => const App()
  );

  static final streams = AppMenuItem(
      title: 'Streams and Blocs',
      routeName: '/fibonacci',
      builder: (_) => const FibonacciApp()
  );

 static final blog = AppMenuItem(
   title: 'Blog',
   routeName: '/blog',
   builder: (_) => BlogApp()
 );

  static final routes = [home, streams, blog];
  static final items = [streams, blog];
}
