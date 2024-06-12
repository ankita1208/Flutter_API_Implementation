import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {required this.labelText,
      required this.textEditingController,
      required this.textInputType,
      required this.obscureText,
      super.key});

  final String labelText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool obscureText;

  @override
  State<StatefulWidget> createState() {
    return _TextFieldWigetState();
  }
}

class _TextFieldWigetState extends State<TextFieldWidget> {
  late String _labelText;
  late TextEditingController _textEditingController;
  late TextInputType _textInputType;
  late bool _obscureText;

  @override
  void initState() {
    _labelText = widget.labelText;
    _textEditingController = widget.textEditingController;
    _textInputType = widget.textInputType;
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      keyboardType: _textInputType,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: _labelText,
        labelStyle: const TextStyle(
          color: Color.fromRGBO(233, 99, 108, 25),
        ),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(233, 99, 108, 25), width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(248, 231, 201, 1), width: 2.0),
        ),
      ),
    );
  }
}
