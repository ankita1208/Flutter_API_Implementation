import 'dart:convert';

import 'package:api_implementation/Utilities/NavigatorUtil.dart';
import 'package:api_implementation/screens/AddEdit.dart';
import 'package:flutter/material.dart';

import '../Utilities/SharedPrefUtils.dart';
import '../apiService/api_service.dart';
import '../model/BooksModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  ApiService apiService = ApiService();
  String? token;

  List<BookModel> books = [];

  @override
  void initState() {
    getTokenFromSharedPref();
  }

  void getTokenFromSharedPref() async {
    token = await SharedPrefUtil.getStringFromPref('token');
    if (token != null) {
      // Token retrieved successfully, now fetch books
      _getAllBooks();
    } else {
      // Handle case where token is not found
      print('Token not found in SharedPreferences');
    }
  }

  void _getAllBooks() async {
    try {
      final response = await apiService.getAllBooks(token!);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        List<BookModel> fetchedBooks =
            jsonList.map((e) => BookModel.fromJson(e)).toList();
        setState(() {
          books = fetchedBooks;
        });
      } else {
        print('Failed to fetch books: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              NavigationUtil.navigateTo(
                context,
                const AddEdit(isEdit: false),
              );
            },
            icon: const Icon(
              Icons.add_box_rounded,
              color: Color.fromRGBO(233, 99, 108, 25),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromRGBO(233, 99, 108, 25),
            margin: const EdgeInsets.all(10), // Adds margin around the card
            elevation: 4, // Elevation for the shadow effect
            child: ListTile(
              leading: const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              title: Text(
                books[index].getRating.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(books[index].getBooksName!,
                  style: const TextStyle(
                    color: Colors.white,
                  )),
              onTap: () {
                NavigationUtil.navigateTo(
                  context,
                  const AddEdit(
                    isEdit: true,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
