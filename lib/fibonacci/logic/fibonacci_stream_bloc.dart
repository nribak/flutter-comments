import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'fibonacci_state.dart';

class FibonacciStreamBloc {
  final _valueSubject = PublishSubject<int>();
  final _loadingSubject = PublishSubject<bool>();

  final _calculationTransformer = StreamTransformer<int, FibonacciState>.fromHandlers(
      handleData: (input, sink) async {
        final now = DateTime.now().millisecondsSinceEpoch;
        final output = await calcFibonacciAsync(input);
        sink.add(FibonacciState(input, output, DateTime.now().millisecondsSinceEpoch - now));
      }
  );

  Stream<FibonacciState> get dataStream => _valueSubject.transform(DoStreamTransformer<int>(
    onData: (value) {
      _loadingSubject.sink.add(true);
    }
  )).transform(_calculationTransformer).transform(DoStreamTransformer<FibonacciState>(
    onData: (value) {
      _loadingSubject.sink.add(false);
    }
  ));

  Stream<bool> get isLoadingStream => _loadingSubject.stream;

  void applyValue(int value) {
    _valueSubject.sink.add(value);
  }

}