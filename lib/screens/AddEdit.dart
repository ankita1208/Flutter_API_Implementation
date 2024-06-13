import 'dart:convert';

import 'package:api_implementation/model/BooksModel.dart';
import 'package:api_implementation/widgets/button.dart';
import 'package:api_implementation/widgets/flatButton.dart';
import 'package:api_implementation/widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';

import '../Utilities/SharedPrefUtils.dart';
import '../apiService/api_service.dart';

class AddEdit extends StatefulWidget {
  const AddEdit({super.key, required this.isEdit});

  final bool isEdit;

  @override
  State<StatefulWidget> createState() {
    return _AddEditState();
  }
}

class _AddEditState extends State<AddEdit> {
  late TextEditingController _idTextEditingController;

  late TextEditingController _bookTextEditingController;

  late TextEditingController _authorTextEditingController;

  late TextEditingController _ratingTextEditingController;

  late bool _isEdit;


  @override
  void initState() {
    _isEdit = widget.isEdit;

  }


  //
  // void setTextInFields() {
  //   for (int i = 0; i < books.length; i++) {
  //     // Access each book using books[i]
  //     BookModel book = books[i];
  //     _idTextEditingController.text = book.getId!;
  //     _bookTextEditingController.text = book.getBooksName!;
  //     _authorTextEditingController.text = book.getAuthor!;
  //     _ratingTextEditingController.text = book.getRating! as String;
  //
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (_isEdit)
            IconButton(
              onPressed: () {
                // Add your onPressed logic here
                print('Edit button pressed');
              },
              icon: const Icon(
                Icons.edit,
                color: Color.fromRGBO(233, 99, 108, 25),
              ),
            ),
        ],
      ),
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
              text: _isEdit ? "Update" : "Add",
              onPressedButton: () {},
            )
          ],
        ),
      ),
    );
  }
}
