import 'package:api_implementation/widgets/button.dart';
import 'package:api_implementation/widgets/flatButton.dart';
import 'package:api_implementation/widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';

class AddEdit extends StatefulWidget {
  const AddEdit(
      {super.key,});


  @override
  State<StatefulWidget> createState() {
    return _AddEditState();
  }
}

class _AddEditState extends State<AddEdit> {
  final TextEditingController _idTextEditingController = TextEditingController();
  final TextEditingController _bookTextEditingController = TextEditingController();
  final TextEditingController _authorTextEditingController = TextEditingController();
  final TextEditingController _ratingTextEditingController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 70.0,
            ),
            TextFieldWidget(
              labelText: 'Id',
              textEditingController: _idTextEditingController,
              textInputType: TextInputType.number,
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              labelText: 'Book Name',
              textEditingController: _bookTextEditingController,
              textInputType: TextInputType.text,
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              labelText: 'Author',
              textEditingController: _authorTextEditingController,
              textInputType: TextInputType.text,
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              labelText: 'Rating',
              textEditingController: _ratingTextEditingController,
              textInputType: TextInputType.number,
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              text: "Add",
              onPressedButton: () {},
            )
          ],
        ),
      ),
    );
  }
}
