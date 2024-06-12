import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {
  const FlatButtonWidget(
      {required this.text, required this.onPressedButton, super.key});

  final String text;
  final VoidCallback onPressedButton;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedButton,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(233, 99, 108, 25),
        ),
      ),
    );
  }
}
