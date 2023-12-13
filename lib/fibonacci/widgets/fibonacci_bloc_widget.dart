import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/fibonacci_bloc.dart';
import 'common/fiboanacci_input_widget.dart';

class FibonacciBlocWidget extends StatelessWidget {

  final bloc = FibonacciBloc.newInstance();

  FibonacciBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          FibonacciInputWidget(calculator: (value) => bloc.add(CalculationEvent(value))),
          const SizedBox(height: 25),
          Row(
            children: [
              BlocBuilder<FibonacciBloc, ExtendedFibonacciState?>(
                bloc: bloc,
                  builder: (context, snapshot) =>
                        Visibility(
                            visible: snapshot != null,
                            child: Text(snapshot?.resultText ?? ''))
                ),
              BlocBuilder<FibonacciBloc, ExtendedFibonacciState?>(
                bloc: bloc,
                builder: (context, snapshot) =>
                  Visibility(
                    visible: snapshot?.isLoading == true,
                      child: const CircularProgressIndicator()
                  ),
              )
            ],
          )

        ]
    );
  }
}