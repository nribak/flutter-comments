import 'package:flutter/material.dart';

import 'widgets/fibonacci_bloc_widget.dart';
import 'widgets/fibonacci_statefull_widget.dart';
import 'widgets/fibonacci_stream_widget.dart';

class FibonacciApp extends StatelessWidget {
  const FibonacciApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Learning Flutter")),
        body: ListView(
            children: [
              FibonacciStreamWidget(),
              FibonacciBlocWidget(),
              const FibonacciStatefulWidget()
            ]
        )
    );
  }
}