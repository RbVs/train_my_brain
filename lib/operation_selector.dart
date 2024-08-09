import 'package:flutter/material.dart';

class OperationSelectorWidget extends StatelessWidget {
  final String Function(String) setOperator;

  const OperationSelectorWidget({super.key, required this.setOperator});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              setOperator("+");
            },
            child: const Text("+"),
          ),
          ElevatedButton(
            onPressed: () {
              setOperator("-");
            },
            child: const Text("-"),
          ),
          ElevatedButton(
            onPressed: () {
              setOperator("x");
            },
            child: const Text("x"),
          ),
          ElevatedButton(
            onPressed: () {
              setOperator("/");
            },
            child: const Text("/"),
          ),
        ],
      ),
    );
  }
}
