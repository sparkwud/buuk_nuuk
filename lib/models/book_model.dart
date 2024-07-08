import 'dart:convert';

import 'package:buuk_nuuk/utils/app_drawables.dart';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

// String bookToJson(Book data) => json.encode(data.toJson());

class Data {
  final String id;
  final Book volumeInfo;

  Data({required this.id, required this.volumeInfo});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as String,
      volumeInfo: Book.fromJson(json['volumeInfo']),
    );
  }
}

class Book {
  final String title;
  final String? subtitle;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final int? pageCount;
  final List<String>? categories;
  final ImageLinks? imageLinks;
  final String? printType;

  Book({
    required this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.categories,
    this.imageLinks,
    this.printType,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      authors: (json['authors'] as List?)?.map((e) => e as String).toList(),
      publisher: json['publisher'] as String?,
      publishedDate: json['publishedDate'] as String?,
      description: json['description'] as String?,
      pageCount: json['pageCount'] as int?,
      categories:
          (json['categories'] as List?)?.map((e) => e as String).toList(),
      printType: json['printType'] ?? 'unknown',
      imageLinks: json['imageLinks'] != null
          ? ImageLinks.fromJson(json['imageLinks'])
          : null,
    );
  }
  String get getAuthors => authors?.join(", ") ?? "No author(s) found";
  String get getImageUrl => imageLinks?.thumbnail ?? AppImages.errorLink;
  String get getDescription => description ?? "No description available";
}

class ImageLinks {
  final String? smallThumbnail;
  final String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
      smallThumbnail: json['smallThumbnail'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );
  }
}
