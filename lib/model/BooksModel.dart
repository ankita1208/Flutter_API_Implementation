import 'dart:io';

class BookModel  {
  String? title;
  String? id;
  String? author;
  String? ISBN;
  String? booksName;
  double? rating;
  BookModel({
    this.title,
    this.id,
    this.author,
    this.ISBN,
    this.booksName,
    this.rating,
  });

  String? get getTitle => title;

  set setTitle(String title) {
    this.title = title;
  }

  String? get getAuthor => author;

  set setAuthor(String author) {
    this.author = author;
  }

  double? get getRating => rating;

  set setRating(double rating) {
    this.rating = rating;
  }

  String? get getId => id;

  set setId(String id) {
    this.id = id;
  }

  String? get getIsbn => ISBN;

  set setIsbn(String ISBN) {
    this.ISBN = ISBN;
  }

  String? get getBooksName => booksName;

  set setBooksName(String booksName) {
    this.booksName = booksName;
  }

  // Factory method to create a BookModel instance from JSON map
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'],
      id: json['id'],
      author: json['author'],
      ISBN: json['ISBN'],
      booksName: json['booksName'],
      rating: json['rating'] != null ? json['rating'].toDouble() : null,
    );
  }
}



