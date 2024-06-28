import 'dart:math' as math;

import 'package:buuk_nuuk/models/category_model.dart';
import 'package:buuk_nuuk/providers/book_service_providers.dart';
import 'package:buuk_nuuk/utils/pallete.dart';
import 'package:buuk_nuuk/utils/text_theme.dart';
import 'package:buuk_nuuk/utils/widget_extensions.dart';
import 'package:buuk_nuuk/views/screens/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryItemScreen extends ConsumerStatefulWidget {
  const CategoryItemScreen({
    super.key,
    required this.category,
  });
  final Category category;

  @override
  ConsumerState<CategoryItemScreen> createState() => _CategoryItemScreenState();
}

class _CategoryItemScreenState extends ConsumerState<CategoryItemScreen> {
  final _random = math.Random();
  late Parameters params;

  @override
  void initState() {
    super.initState();
    params = Parameters(category: widget.category, maxResult: 20);
  }

  @override
  Widget build(BuildContext context) {
    final categoryItems = ref.watch(
      booksFromCategoryProvider(params),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: appColors.black),
        title: Text(
          widget.category.name.toTitleCase(),
          style: textTheme.displayMedium,
        ),
      ),
      body: categoryItems.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stacktrace) {
          return const Center(
            child: Text("Opps! Try again later!"),
          );
        },
        data: (books) => GridView.builder(
          itemCount: books.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //childAspectRatio: 16 / 15,
            crossAxisCount: 2,
            mainAxisExtent: 260,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemBuilder: (context, index) {
            final book = books[index];
            return Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailsScreen(
                        bookDetails: book,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: constraints.maxHeight / 2,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  height: constraints.maxHeight / 2.5,
                                  decoration: BoxDecoration(
                                    color:
                                        appColors.boxColors[_random.nextInt(7)],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: SizedBox(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Hero(
                                          tag: book,
                                          child: Image(
                                            height: constraints.maxHeight / 2,
                                            width: constraints.maxWidth / 2,
                                            image: NetworkImage(
                                              "${book.imageLinks!.thumbnail}",
                                            ),
                                            fit: BoxFit.fill, // use this
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        fontSize: constraints.maxWidth * 0.09,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  "${book.authors?.join(', ')}",
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        fontSize: constraints.maxWidth * 0.09,
                                      ),
                                ),
                                Container(
                                  height: constraints.maxHeight * 0.13,
                                  width: constraints.maxWidth * 0.35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: appColors.black,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    "\$${book.pageCount}",
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.08,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
