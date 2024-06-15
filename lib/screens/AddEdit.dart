import 'package:api_implementation/apiService/api_service.dart';
import 'package:api_implementation/model/BooksModel.dart';
import 'package:api_implementation/widgets/button.dart';
import 'package:uuid/uuid.dart';
import 'package:api_implementation/widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';

import '../Utilities/SharedPrefUtils.dart';
import '../Utilities/SnackbarUtil.dart';

class AddEdit extends StatefulWidget {
  const AddEdit({super.key, required this.isEdit, this.bookModel});

  final bool isEdit;

  // to make the bookmodel not a required parameter
  final BookModel? bookModel;

  @override
  State<StatefulWidget> createState() {
    return _AddEditState();
  }
}

class _AddEditState extends State<AddEdit> {
  late final TextEditingController _idTextEditingController =
      TextEditingController();

  late final TextEditingController _bookTextEditingController =
      TextEditingController();

  late final TextEditingController _authorTextEditingController =
      TextEditingController();

  late final TextEditingController _ratingTextEditingController =
      TextEditingController();

  late bool _isEdit;

  late BookModel _bookModel;

  late ApiService apiService = ApiService();
  String? token;
  final Uuid uuid = Uuid();

  @override
  void initState() {
    _isEdit = widget.isEdit;
    if(_isEdit){
      _bookModel = widget.bookModel!;
    }
    getTokenFromSharedPref();

    setState(() {
      if(_isEdit)  {
        setTextInFields();
      }
    });
  }

  void getTokenFromSharedPref() async {
    token = await SharedPrefUtil.getStringFromPref('token');
  }

  void _hitAddBookApi() async {
    handleValidation();

    try {
      BookModel bookModel = BookModel(
          title: "",
          author: _authorTextEditingController.text,
          id: uuid.v4(),
          rating: double.tryParse(_ratingTextEditingController.text),
          booksName: _bookTextEditingController.text,
          ISBN: _idTextEditingController.text);
      final response = await apiService.addBook(token!, bookModel);
      if (response.statusCode == 200) {
        SnackbarUtil.showSnackBar(context, 'Book added successfully!');
        Navigator.of(context).pop();
      } else {
        print('Failed to add book: ${response.statusCode}');
        SnackbarUtil.showSnackBar(context, 'Failed to add book');
      }
    } catch (e) {
      print('Error fetching books: $e');
      SnackbarUtil.showSnackBar(context, 'Failed to add book $e');
    }
  }

  void _hitEditBookApi() async {
    handleValidation();

    try {
      BookModel bookModel = BookModel(
          title: "",
          author: _authorTextEditingController.text,
          id: _bookModel.getId,
          rating: double.tryParse(_ratingTextEditingController.text),
          booksName: _bookTextEditingController.text,
          ISBN: _idTextEditingController.text);
      final response =
          await apiService.editBook(_bookModel.getId!, token!, bookModel);
      if (response.statusCode == 200) {
        SnackbarUtil.showSnackBar(context, 'Book updated successfully!');
        Navigator.of(context).pop();
      } else {
        print('Failed to edit book: ${response.statusCode}');
        SnackbarUtil.showSnackBar(context, 'Failed to edit book');
      }
    } catch (e) {
      print('Error fetching books: $e');
      SnackbarUtil.showSnackBar(context, 'Failed to edit book $e');
    }
  }

  void setTextInFields() {
    _idTextEditingController.text = _bookModel.getIsbn!;
    _bookTextEditingController.text = _bookModel.getBooksName!;
    _authorTextEditingController.text = _bookModel.getAuthor!;
    _ratingTextEditingController.text = _bookModel.getRating!.toString();
  }

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
              labelText: 'ISBN',
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
              onPressedButton: () {
                _isEdit ? _hitEditBookApi() : _hitAddBookApi();
              },
            )
          ],
        ),
      ),
    );
  }

  void handleValidation() {
    if (_bookTextEditingController.text.isEmpty ||
        _authorTextEditingController.text.isEmpty ||
        _ratingTextEditingController.text.isEmpty) {
      SnackbarUtil.showSnackBar(context, "Please fill in all fields");
      return;
    }
  }
}
