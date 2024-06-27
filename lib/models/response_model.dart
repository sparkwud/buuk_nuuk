import 'dart:convert';

import 'package:buuk_nuuk/models/book_model.dart';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

// String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  final String kind;
  final int totalItems;
  final List<Item> items;

  ResponseModel({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "kind": kind,
  //       "totalItems": totalItems,
  //       "items": List<dynamic>.from(items.map((x) => x.toJson())),
  //     };
}

class Item {
  final String kind;
  final String id;
  final String etag;
  final String selfLink;
  final Book bookInfo;

  Item({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.bookInfo,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        bookInfo: Book.fromJson(json["volumeInfo"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "kind": kind,
  //       "id": id,
  //       "etag": etag,
  //       "selfLink": selfLink,
  //       "volumeInfo": bookInfo.toJson(),
  //     };
}
