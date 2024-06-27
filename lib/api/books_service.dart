import 'dart:convert';

import 'package:buuk_nuuk/api/endpoints.dart';
import 'package:buuk_nuuk/models/book_model.dart';
import 'package:buuk_nuuk/models/category_model.dart';
import 'package:buuk_nuuk/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BooksService {
  Future<List<Book>> searchBooks(String query) async {
    final url = Endpoints.search(query: query);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final items = ResponseModel.fromJson(json.decode(response.body)).items;
      final books = items.map((data) => data.bookInfo).toList();
      return books;
    } else {
      throw Exception("Failed to load books");
    }
  }

  Future<Book> getDetailsFromId(String id) async {
    final url = Endpoints.details(id: id);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final bookDetails = Book.fromJson(json.decode(response.body));
      return bookDetails;
    } else {
      throw Exception("Failed to book details");
    }
  }

  Future<List<Book>> getBooksFromCategory({
    required Category category,
    required int maxResult ,
  }) async {
    final url = Endpoints.searchCategory(
      query: category.query,
      maxResult: maxResult,
    );
    debugPrint(url.toString());
    try {
      final response = await http.get(url);
      debugPrint('Response status code: ${response.statusCode}');
      // debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        debugPrint('if this shows then the status code is 200');

        final items = responseModelFromJson(response.body).items;
        final books = items.map((item) => item.bookInfo).toList();
        debugPrint(books[0].toString());
        return books;
      } else {
        throw Exception("Failed to load books");
      }
    } catch (e) {
      debugPrint('Error in getBooksFromCategory: $e');

      throw Exception("Failed to load books");
    }
  }
}
