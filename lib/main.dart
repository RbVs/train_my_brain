import 'dart:math';
import 'package:flutter/material.dart';
import 'package:train_my_brain/equation_member.dart';
import 'package:train_my_brain/num_pad.dart';
import 'package:train_my_brain/operation_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Brain Trainer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mathe macht Spaß!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int num1;
  late int num2;
  late int result;
  late String input;
  String operator = "";
  String equals = "=";
  late Color color;

  @override
  void initState() {
    num1 = getRandomNumber();
    num2 = getRandomNumber();
    result = num1 + num2;
    operator = initializeOperator();
    input = initInput();
    color = Colors.black;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: OperationSelectorWidget(setOperator: setOperator),
      body: Column(
        children: <Widget>[
          const Spacer(),
          Column(
            children: [
              const Text("Wie viel ist?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EquationMember(value: num1),
                  EquationMember(value: operator),
                  EquationMember(value: num2),
                  EquationMember(value: equals),
                  EquationMember(value: input, color: color),
                ],
              ),
            ],
          ),
          const Spacer(),
          Expanded(child: Container()),
          NumPad(setInput: setInput),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void onPressed() {
    setState(() {
      num1 = getRandomNumber();
      num2 = getRandomNumber();
    });
  }

  int getRandomNumber() {
    return Random().nextInt(10);
  }

  String setOperator(String newOperator) {
    setState(() {
      operator = newOperator;
    });
    return operator;
  }

  String initializeOperator() {
    if (operator == "") {
      operator = '+';
      input = '???';
    }
    return operator;
  }

  String initInput() {
    if (input == "" || input == "enter") {
      input = "???";
    }
    return input;
  }

  void setInput(String value) {
    setState(() {
      if (value == "clear") {
        input = "???";
        return;
      }
      if (input == "???") {
        input = value;
        return;
      }
      if (value == "enter" && input != "???" && input != "") {
        evaluateResult();
        return;
      } else {
        input = input + value;
        return;
      }
    });
  }

  void evaluateResult() {
    int inputAsInt = int.parse(input);
    bool isCorrect = false;

    switch (operator) {
      case "+":
        isCorrect = (inputAsInt == num1 + num2);
        break;
      case "-":
        isCorrect = (inputAsInt == num1 - num2);
        break;
      case "x":
        isCorrect = (inputAsInt == num1 * num2);
        break;
      case "/":
        isCorrect = (inputAsInt == num1 ~/ num2);
        break;
    }

    color = isCorrect ? Colors.green : Colors.red;
  }
}
