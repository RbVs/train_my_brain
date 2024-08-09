import 'package:flutter/material.dart';

class EquationMember extends StatelessWidget {
  final dynamic value;
  final Color? color;

  const EquationMember({super.key, required this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Text(
        value.toString(),
        style: TextStyle(
          fontSize: 40,
          color: color,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
