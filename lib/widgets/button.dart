import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    required this.text,
    required this.onPressedButton,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressedButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color.fromRGBO(233, 99, 108, 25),
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size(150, 50),
      ),
      onPressed: onPressedButton,
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
