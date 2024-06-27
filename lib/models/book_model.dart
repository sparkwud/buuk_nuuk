import 'dart:convert';

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



// class Book {
//   const Book({
//     this.title = '',
//     this.subtitle = '',
//     this.authors = const [],
//     this.publisher = '',
//     this.averageRating = 0,
//     this.categories = const [],
//     this.description = '',
//     required this.imageLinks,
//     this.pageCount = 0,
//     required this.publishedDate,
//     this.ratingsCount = 0,
//     required this.previewLink,
//     required this.infoLink,
//     this.industryIdentifiers = const [],
//   });

//   final String title;
//   final String subtitle;
//   final List<String> authors;
//   final String publisher;
//   final DateTime? publishedDate;
//   final String description;
//   final int pageCount;
//   final List<String> categories;
//   final double averageRating;
//   final int ratingsCount;
//   final ImageLinks? imageLinks;
//   final Uri previewLink;
//   final Uri infoLink;
//   final List<IndustryIdentifier> industryIdentifiers;

//   factory Book.fromJson(Map<String, dynamic> json) => Book(
//         title: json["title"],
//         subtitle: json["subtitle"],
//         authors: json["authors"] == null
//             ? []
//             : List<String>.from(json["authors"]!.map((x) => x)),
//         publisher: json["publisher"], 
//         publishedDate: json["publishedDate"],
//         description: json["description"],
//         pageCount: json["pageCount"],
//         categories: json["categories"] == null
//             ? []
//             : List<String>.from(json["categories"]!.map((x) => x)),
//         imageLinks: json["imageLinks"] == null
//             ? null
//             : ImageLinks.fromJson(json["imageLinks"]),
//         previewLink: json["previewLink"],
//         infoLink: json["infoLink"],
//         averageRating: json["averageRating"]?.toDouble(),
//         ratingsCount: json["ratingsCount"],
//         industryIdentifiers: List<IndustryIdentifier>.from(
//           json["industryIdentifiers"]
//               .map((x) => IndustryIdentifier.fromJson(x)),
//         ),
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "subtitle": subtitle,
//         "publisher": publisher,
//         "authors": List<dynamic>.from(authors.map((x) => x)),
//         "publishedDate": publishedDate,
//         "description": description,
//         "pageCount": pageCount,
//         "categories": List<dynamic>.from(categories.map((x) => x)),
//         "imageLinks": imageLinks?.toJson(),
//         "previewLink": previewLink,
//         "infoLink": infoLink,
//         "averageRating": averageRating,
//         "ratingsCount": ratingsCount,
//         "industryIdentifiers":
//             List<dynamic>.from(industryIdentifiers.map((x) => x.toJson())),
//       };
// }

// class ImageLinks {
//   final String? smallThumbnail;
//   final String? thumbnail;

//   ImageLinks({
//     this.smallThumbnail,
//     this.thumbnail,
//   });

//   factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
//         smallThumbnail: json["smallThumbnail"],
//         thumbnail: json["thumbnail"],
//       );

//   Map<String, dynamic> toJson() => {
//         "smallThumbnail": smallThumbnail,
//         "thumbnail": thumbnail,
//       };
// }

// class IndustryIdentifier {
//   final String? type;
//   final String? identifier;

//   IndustryIdentifier({
//     this.type,
//     this.identifier,
//   });

//   factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
//       IndustryIdentifier(
//         type: json["type"],
//         identifier: json["identifier"],
//       );

//   Map<String, dynamic> toJson() => {
//         "type": type,
//         "identifier": identifier,
//       };
// }
