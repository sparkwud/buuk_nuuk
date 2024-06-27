import 'package:buuk_nuuk/models/category_model.dart';
import 'package:buuk_nuuk/providers/book_service_providers.dart';
import 'package:buuk_nuuk/utils/app_drawables.dart';
import 'package:buuk_nuuk/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../widgets/book_card.dart';
import '../widgets/news_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Parameters params;

  @override
  void initState() {
    super.initState();
    params = Parameters(category: Category.fiction);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final booksAsyncValue = ref.watch(
      booksFromCategoryProvider(params),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BookNook',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: AppIcons.icSearch.svgPicture(),
            onPressed: () {},
          ),
        ],
      ),
      body: booksAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('Failed to load books: $error')),
        data: (books) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image:
                          NetworkImage('https://via.placeholder.com/300x180'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'We found the best',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          'Books For You',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Over 10,000 books on our service',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                const Text(
                  'Books for you',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Gap(10),
                SizedBox(
                  height: height * 1 / 4,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const Gap(10),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return BookCard(
                        title: book.title,
                        imageUrl: book.imageLinks?.thumbnail,
                      );
                    },
                  ),
                ),
                const Gap(20),
                const Text(
                  'News',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Gap(10),
                const NewsCard(
                  title: 'The Subtle Art of Not...',
                  author: 'Karen Joy Fowler',
                  rating: 3.7,
                ),
                const NewsCard(
                  title: 'The Subtle Art of Not...',
                  author: 'Karen Joy Fowler',
                  rating: 3.7,
                ),
                const NewsCard(
                  title: 'The Subtle Art of Not...',
                  author: 'Karen Joy Fowler',
                  rating: 3.7,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
