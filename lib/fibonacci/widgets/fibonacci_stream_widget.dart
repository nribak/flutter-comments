import 'package:flutter/material.dart';

import '../logic/fibonacci_stream_bloc.dart';
import 'common/fiboanacci_input_widget.dart';

class FibonacciStreamWidget extends StatelessWidget {
  FibonacciStreamWidget({super.key});

  final bloc = FibonacciStreamBloc();

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          FibonacciInputWidget(calculator: bloc.applyValue),
          const SizedBox(height: 25),
          Row(
            children: [
              StreamBuilder(
                  stream: bloc.dataStream,
                  builder: (context, snapshot) =>
                      Visibility(
                          visible: snapshot.hasData,
                          child: Text(snapshot.data?.resultText ?? ''))
              ),
              StreamBuilder(
                  stream: bloc.isLoadingStream,
                  builder: (context, snapshot) =>
                      Visibility(
                        visible: snapshot.data == true,
                          child: const CircularProgressIndicator()
                      )
              )
            ],
          )

        ]
    );
  }
}