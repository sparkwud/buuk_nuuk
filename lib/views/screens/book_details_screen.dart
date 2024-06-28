import 'dart:math' as math;

import 'package:buuk_nuuk/models/book_model.dart';
import 'package:buuk_nuuk/utils/pallete.dart';
import 'package:buuk_nuuk/utils/text_theme.dart';
import 'package:buuk_nuuk/views/widgets/book_details_widget.dart';
import 'package:buuk_nuuk/views/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({
    super.key,
    required this.bookDetails,
  });

  final Book bookDetails;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    double width = MediaQuery.of(context).size.width / 375;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 350,
              child: Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: height * 200,
                    decoration: BoxDecoration(
                      color:
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(1.0),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: height * 250,
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Hero(
                          tag: widget.bookDetails,
                          child: Image(
                            image: NetworkImage(
                              "${widget.bookDetails.imageLinks?.thumbnail}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 16,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 1),
                      ),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: appColors.black,
                      ),
                      label: const Text(
                        "",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.bookDetails.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${widget.bookDetails.authors?.join(', ')}".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.bookDetails.printType}",
                          style: textTheme.headlineMedium,
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        Container(
                          height: height * 35,
                          width: width * 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: appColors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "\$${widget.bookDetails.pageCount}",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "${widget.bookDetails.pageCount} Pages",
                          style: textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          // Uri url = Uri.parse(
                          //     "${widget.bookDetails.previewLink}");

                          // if (await canLaunchUrl(url)) {
                          //   await launchUrl(url,
                          //       mode: LaunchMode
                          //           .externalApplication);
                          // } else {
                          //   throw 'could not launch $url';
                          // }
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1),
                        ),
                        child: Text(
                          "VIEW ONLINE",
                          style: textTheme.headlineMedium,
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1),
                        ),
                        icon: Icon(
                          Icons.favorite_outline,
                          color: appColors.black,
                        ),
                        label: Text(
                          "WISHLIST",
                          style: textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BookDetailsWidget(
                    author: "${widget.bookDetails.authors?.join(", ")}",
                    category: "${widget.bookDetails.categories?[0]}",
                    publishedDate: "${widget.bookDetails.publishedDate}",
                    publisher: "${widget.bookDetails.publisher}",
                  ),
                  const Gap(20),
                  Text(
                    "Description",
                    style: textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ExpandableText(
                    text: widget.bookDetails.description ??
                        "No description available",
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      // Uri url = Uri.parse(
                      //     "${widget.bookDetails.infoLink}");

                      // if (await canLaunchUrl(url)) {
                      //   await launchUrl(url,
                      //       mode:
                      //           LaunchMode.externalApplication);
                      // } else {
                      //   throw 'could not launch $url';
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appColors.black,
                    ),
                    child: Text(
                      "Buy",
                      style: textTheme.displayMedium?.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
