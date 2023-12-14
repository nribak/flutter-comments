import 'package:flutter/material.dart';

class FibonacciInputWidget extends StatelessWidget {
  final void Function(int value) calculator;
  FibonacciInputWidget({super.key, required this.calculator});

  final controller = TextEditingController(text: "1");

  void _handleClick() {
    final number = int.parse(controller.text);
    calculator(number);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    label: Text("enter number")
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(onPressed: _handleClick, child: const Text("calculate"))
          ],
        ),
      ),
    );
  }

}