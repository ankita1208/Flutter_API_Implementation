import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://192.168.1.10:3000";

  Future<http.Response> signUp (String username, String email, String password) async {
    final url = Uri.parse('$baseUrl/api/signup');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );
    return response;
  }

  Future<http.Response> login (String username, String password) async {
    final url = Uri.parse('$baseUrl/api/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );
    return response;
  }

  Future<http.Response> getAllBooks (String accessToken) async {
    final url = Uri.parse('$baseUrl/api/books');
    final response = await http.get(
      url,
      headers: {
        'Authorization' : 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}



