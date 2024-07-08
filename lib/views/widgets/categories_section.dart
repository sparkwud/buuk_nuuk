import 'package:buuk_nuuk/models/category_model.dart';
import 'package:buuk_nuuk/providers/book_service_providers.dart';
import 'package:buuk_nuuk/utils/pallete.dart';
import 'package:buuk_nuuk/utils/text_theme.dart';
import 'package:buuk_nuuk/views/screens/book_details_screen.dart';
import 'package:buuk_nuuk/views/screens/category_items_screen.dart';
import 'package:buuk_nuuk/views/widgets/book_cover_3d.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class HomeCategoriesSection extends ConsumerStatefulWidget {
  const HomeCategoriesSection({
    super.key,
    required this.category,
  });
  final Category category;

  @override
  ConsumerState<HomeCategoriesSection> createState() =>
      _HomeCategoriesSectionState();
}

class _HomeCategoriesSectionState extends ConsumerState<HomeCategoriesSection> {
  late Parameters params;

  @override
  void initState() {
    super.initState();
    params = Parameters(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    final booksValue = ref.watch(
      booksFromCategoryProvider(params),
    );
    return booksValue.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) =>
          Center(child: Text('Failed to load books: $error')),
      data: (books) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.category.title,
                style: textTheme.displayMedium!.copyWith(
                  color: colorScheme.secondary,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryItemScreen(
                        category: widget.category,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const Text(
                      "See All",
                    ),
                    const Gap(4),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: colorScheme.secondary,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(8),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Gap(16),
              shrinkWrap: true,
              // physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];

                return GestureDetector(
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
                  child: Hero(
                    tag: book,
                    child: BookCover3D(
                      imageUrl: book.getImageUrl,
                      title: book.title,
                      author: book.getAuthors,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
