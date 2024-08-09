import 'package:flutter/material.dart';
import 'package:train_my_brain/calculator_button.dart';

class NumPad extends StatelessWidget {
  final void Function(String) setInput;

  const NumPad({
    super.key,
    required this.setInput,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.75,
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          ...[
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "0",
            "clear",
            "enter",
          ].map((number) => CalculatorButton(
                label: number,
                onTap: () {
                  setInput(number);
                },
              )),
        ],
      ),
    );
  }
}
