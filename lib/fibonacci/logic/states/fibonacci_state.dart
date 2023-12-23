import 'package:flutter/foundation.dart';

class FibonacciState {
  final int input;
  final int output;
  final int time;

  FibonacciState(this.input, this.output, this.time);

  FibonacciState copy({int? input, int? output, int? time}) =>
      FibonacciState(input ?? this.input, output ?? this.output, time ?? this.time);

  String get resultText => "fib($input) = $output measured time $time ms";
}


Future<int> calcFibonacciAsync(int input) => compute(calcFibonacci, input);

int calcFibonacci(int input) {
  if(input > 2) {
    return calcFibonacci(input - 1) + calcFibonacci(input - 2);
  } else {
    return 1;
  }
}
