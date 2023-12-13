import 'package:flutter/material.dart';

import 'fibonacci/widgets/fibonacci_bloc_widget.dart';
import 'fibonacci/widgets/fibonacci_statefull_widget.dart';
import 'fibonacci/widgets/fibonacci_stream_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

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