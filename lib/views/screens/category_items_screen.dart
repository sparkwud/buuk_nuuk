import 'package:buuk_nuuk/models/book_model.dart';
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
  late Parameters params;

  @override
  void initState() {
    super.initState();
    params = Parameters(category: widget.category, maxResult: 20);
  }

  @override
  Widget build(BuildContext context) {
    final categoryItems = ref.watch(booksFromCategoryProvider(params));
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(
              //   widget.category.name.toTitleCase(),
              //   style: textTheme.headlineMedium!.copyWith(color: Colors.white),
              // ),
              title: Text(
                widget.category.name.toTitleCase(),
                style: textTheme.displayMedium!.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              background: Image.network(
                widget.category.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: categoryItems.when(
              loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stacktrace) => const SliverFillRemaining(
                child: Center(child: Text("Oops! Try again later!")),
              ),
              data: (books) => SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => BookCard(book: books[index]),
                  childCount: books.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookDetailsScreen(bookDetails: book),
        ),
      ),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Hero(
                  tag: book,
                  child: Image.network(
                    book.getImageUrl,
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: Text(
                        book.getAuthors,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
