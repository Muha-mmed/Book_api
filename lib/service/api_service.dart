import 'dart:convert';

import 'package:bloc_api/model/book.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Book>> getBooks() async {
    const url = "https://potterapi-fedeperin.vercel.app/en/books";
    final Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> Bookjson = jsonDecode(response.body);
      return Bookjson.map((json) => Book.fromJSON(json)).toList();
    }
    throw Exception("failed to fetch Books");
  }
}
