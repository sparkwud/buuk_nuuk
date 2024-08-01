import 'package:buuk_nuuk/models/category_model.dart';
import 'package:buuk_nuuk/providers/book_service_providers.dart';
import 'package:buuk_nuuk/utils/context_extension.dart';
import 'package:buuk_nuuk/utils/pallete.dart';
import 'package:buuk_nuuk/utils/text_theme.dart';
import 'package:buuk_nuuk/views/screens/book_details_screen.dart';
import 'package:buuk_nuuk/views/widgets/book_cover_3d.dart';
import 'package:buuk_nuuk/views/widgets/categories_section.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

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
    params = Parameters(category: Category.coding);
  }

  @override
  Widget build(BuildContext context) {
    final booksAsyncValue = ref.watch(
      booksFromCategoryProvider(params),
    );
    return Scaffold(
      backgroundColor: colorScheme.primary,
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     'BuukNuuk',
      //     style: TextStyle(
      //       fontSize: 18,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.menu),
      //     onPressed: () {},
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: AppIcons.icSearch.svgPicture(),
      //       onPressed: () => showSearch(
      //         context: context,
      //         delegate: SearchScreen(),
      //       ),
      //     ),
      //   ],
      // ),
      body: booksAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => const Center(
          child: Text(
            'Failed to load books. Please check your internet connection',
            textAlign: TextAlign.center,
          ),
        ),
        data: (books) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: colorScheme.secondary,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: context.height / 2.5,
                        decoration: BoxDecoration(
                          color: colorScheme.secondary,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(45),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Buuk Nuuk",
                              style: textTheme.displayLarge!.copyWith(
                                color: colorScheme.primary,
                              ),
                            ),
                            const Gap(20),
                            // InkWell(
                            //   onTap: () {
                            //     showSearch(
                            //       context: context,
                            //       delegate: BookSearchDelegate(

                            //       ),
                            //     );
                            //   },
                            //   child: const StaticSearchContainer(),
                            // ),
                            const Gap(20),
                            Text(
                              "Top Picks",
                              style: textTheme.displayMedium!.copyWith(
                                color: colorScheme.primary,
                              ),
                            ),
                            const Gap(16),
                            CarouselSlider.builder(
                              itemCount: books.length,
                              itemBuilder: (context, index, realIndex) {
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
                              options: CarouselOptions(
                                aspectRatio: 1.5,
                                enlargeCenterPage: true,
                                viewportFraction: 0.45,
                                enlargeFactor: 0.4,
                                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              ),
                            ),
                            const Gap(20),
                            SizedBox(
                              height: context.width * 0.72,
                              //height: constraints.maxHeight * 0.38,
                              child: const HomeCategoriesSection(
                                category: Category.fiction,
                              ),
                            ),
                            const Gap(16),
                            SizedBox(
                              height: context.width * 0.72,
                              child: const HomeCategoriesSection(
                                category: Category.computers,
                              ),
                            ),
                            const Gap(16),
                            SizedBox(
                              height: context.width * 0.72,
                              child: const HomeCategoriesSection(
                                category: Category.classic,
                              ),
                            ),
                            const Gap(16),
                            SizedBox(
                              height: context.width * 0.72,
                              child: const HomeCategoriesSection(
                                category: Category.history,
                              ),
                            ),
                            const Gap(16),
                            const Text(
                              'News',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
