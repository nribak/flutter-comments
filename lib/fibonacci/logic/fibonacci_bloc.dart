import 'package:bloc/bloc.dart';

import 'states/fibonacci_state.dart';

final class CalculationEvent {
  final int input;

  CalculationEvent(this.input);
}

class ExtendedFibonacciState extends FibonacciState {
  final bool isLoading;
  ExtendedFibonacciState(super.input, super.output, super.time, this.isLoading);
}

class FibonacciBloc extends Bloc<CalculationEvent, ExtendedFibonacciState?> {
  FibonacciBloc(): super(null);

  void _init() {
    on<CalculationEvent>((event, emit) async {
      emit(ExtendedFibonacciState(0, 0, 0, true));
      final now = DateTime.now().millisecondsSinceEpoch;
      final output = await calcFibonacciAsync(event.input);
      emit(ExtendedFibonacciState(event.input, output, DateTime.now().millisecondsSinceEpoch - now, false));

    });
  }

  factory FibonacciBloc.newInstance() {
    final bloc = FibonacciBloc();
    bloc._init();
    return bloc;
  }
}