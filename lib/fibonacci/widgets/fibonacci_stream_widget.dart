import 'package:flutter/material.dart';

import '../logic/fibonacci_stream_bloc.dart';

class FibonacciStreamWidget extends StatelessWidget {
  FibonacciStreamWidget({super.key});

  final bloc = FibonacciStreamBloc();

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextField(
                    onChanged: bloc.setValue,
                    decoration: const InputDecoration(label: Text("enter number")),
                    keyboardType: TextInputType.number,
                  )
              ),
              ElevatedButton(
                  onPressed: bloc.applyValue,
                  child: const Text("calculate")
              )
            ]
          ),
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