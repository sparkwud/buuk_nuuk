import 'dart:ui';

import 'package:buuk_nuuk/models/book_model.dart';
import 'package:buuk_nuuk/utils/pallete.dart';
import 'package:buuk_nuuk/utils/text_theme.dart';
import 'package:buuk_nuuk/views/widgets/book_details_widget.dart';
import 'package:buuk_nuuk/views/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

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
  bool isInShelf = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildBookTitle(),
                  _buildBookAuthor(),
                  const Gap(20),
                  _buildBookInfo(),
                  const Gap(20),
                  _buildActionButtons(),
                  const Gap(20),
                  _buildBookDetails(),
                  const Gap(20),
                  _buildSynopsis(),
                  const Gap(20),
                  _buildPreviewButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildSliverAppBar() {
  //   return SliverAppBar(
  //     expandedHeight: 300,
  //     floating: false,
  //     pinned: true,
  //     flexibleSpace: FlexibleSpaceBar(
  //       background: Hero(
  //         tag: widget.bookDetails,
  //         child: Image.network(
  //           widget.bookDetails.getImageUrl,
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //     ),
  //     actions: [
  //       IconButton(
  //         icon: Icon(
  //           isInShelf ? Icons.favorite : Icons.favorite_border,
  //           color: Colors.red,
  //         ),
  //         onPressed: () {
  //           setState(() {
  //             isInShelf = !isInShelf;
  //           });
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(
  //               behavior: SnackBarBehavior.floating,
  //               content: Text(
  //                 isInShelf ? 'Added to Shelf' : 'Removed from Shelf',
  //               ),
  //               duration: const Duration(seconds: 2),
  //             ),
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 250,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            // Blurred background
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Image.network(
                widget.bookDetails.getImageUrl,
                fit: BoxFit.cover,
              ),
            ),
            // Overlay to darken the image
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            // Book cover
            Positioned(
              bottom: -20,
              left: 20,
              child: Hero(
                tag: widget.bookDetails,
                child: Container(
                  width: 120,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.bookDetails.getImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: Icon(
            isInShelf ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            setState(() {
              isInShelf = !isInShelf;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(
                  isInShelf ? 'Added to Shelf' : 'Removed from Shelf',
                ),
                duration: const Duration(seconds: 2),
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.share, color: Colors.white),
          onPressed: () {
            // Implement share functionality
          },
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onPressed: () {
            // Implement more options functionality
          },
        ),
      ],
    );
  }

  Widget _buildBookTitle() {
    return Text(
      widget.bookDetails.title,
      style: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildBookAuthor() {
    return Text(
      "${widget.bookDetails.authors?.join(', ')}".toUpperCase(),
      style: textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildBookInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildInfoItem(Icons.book, "${widget.bookDetails.printType}"),
        _buildInfoItem(Icons.attach_money, "\$${widget.bookDetails.pageCount}"),
        _buildInfoItem(Icons.pages, "${widget.bookDetails.pageCount} Pages"),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: colorScheme.primary),
        const Gap(4),
        Text(text, style: textTheme.bodyMedium),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
          "Preview",
          Icons.visibility,
          () => _launchURL(widget.bookDetails.previewLink),
        ),
        _buildActionButton(
          "Buy",
          Icons.shopping_cart,
          () {
            // Implement buy functionality
          },
        ),
      ],
    );
  }

  Widget _buildActionButton(
    String label,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: colorScheme.primary,
      ),
    );
  }

  Widget _buildBookDetails() {
    return BookDetailsWidget(
      author: "${widget.bookDetails.authors?.join(", ")}",
      category: "${widget.bookDetails.categories?[0]}",
      publishedDate: "${widget.bookDetails.publishedDate}",
      publisher: "${widget.bookDetails.publisher}",
    );
  }

  Widget _buildSynopsis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Synopsis", style: textTheme.headlineSmall),
        const Gap(8),
        ExpandableText(
          text: widget.bookDetails.description ?? "No description available",
        ),
      ],
    );
  }

  Widget _buildPreviewButton() {
    return ElevatedButton(
      onPressed: () => _launchURL(widget.bookDetails.previewLink),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: colorScheme.secondary,
      ),
      child: const Text("Read Sample"),
    );
  }

  Future<void> _launchURL(String? url) async {
    if (url == null) return;
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch $url';
    }
  }
}
