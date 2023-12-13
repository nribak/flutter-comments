import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../logic/fibonacci_state.dart';
import 'common/fiboanacci_input_widget.dart';

class FibonacciStatefulWidget extends StatefulWidget {
  const FibonacciStatefulWidget({super.key});

  @override
  State<StatefulWidget> createState() => _FibonacciState();
}

class _FibonacciState extends State<FibonacciStatefulWidget> {

  FibonacciState? state;
  bool isLoading = false;

  void _calc(int value) {
    final now = DateTime.now().millisecondsSinceEpoch;

    setState(() {
      isLoading = true;
    });

    compute<int, int>(calcFibonacci, value).then((output) {
        setState(() {
          state = FibonacciState(value, output, DateTime.now().millisecondsSinceEpoch - now);
          isLoading = false;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          FibonacciInputWidget(calculator: _calc),
          const SizedBox(height: 25),
          Row(
            children: [
              Visibility(
                  visible: state != null,
                  child: Text(state?.resultText ?? '')),
              Visibility(
                  visible: isLoading == true,
                  child: const CircularProgressIndicator()
              )
            ],
          )

        ]
    );
  }
}