// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buuk_nuuk/models/category_model.dart';
import 'package:buuk_nuuk/providers/book_service_providers.dart';
import 'package:buuk_nuuk/providers/recent_searches_provider.dart';
import 'package:buuk_nuuk/utils/pallete.dart';
import 'package:buuk_nuuk/utils/text_theme.dart';
import 'package:buuk_nuuk/views/screens/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../widgets/static_search_container.dart';

class RecentSearches extends StatelessWidget {
  final List<String> recentSearches;
  final VoidCallback onClearAll;
  final Function(String) onRemove;
  final Function(String) onSearch;

  const RecentSearches({
    super.key,
    required this.recentSearches,
    required this.onClearAll,
    required this.onRemove,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent',
                style: textTheme.titleMedium,
              ),
              if (recentSearches.isNotEmpty)
                TextButton(
                  onPressed: onClearAll,
                  child: const Text('Clear All'),
                ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: recentSearches.length,
            itemBuilder: (context, index) {
              final search = recentSearches[index];
              return ListTile(
                leading: const Icon(Icons.history),
                title: Text(search),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => onRemove(search),
                ),
                onTap: () => onSearch(search),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final recentSearches = ref.watch(recentSearchesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: textTheme.displayLarge!.copyWith(
            color: colorScheme.primary,
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: AppIcons.icSearch.svgPicture(
        //       color: colorScheme.primary,
        //       height: 20,
        //     ),
        //     onPressed: () {
        //       showSearch(context: context, delegate: BookSearchDelegate());
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Container(
            color: colorScheme.secondary,
            padding: const EdgeInsets.all(16),
            child: StaticSearchContainer(
              onSearch: (query) => ref
                  .read(recentSearchesProvider.notifier)
                  .addRecentSearch(query),
              hint: "Search titles, topics or authors",
            ),
          ),
          Expanded(
            child: RecentSearches(
              recentSearches:  recentSearches,
              onRemove: (query) => ref
                  .read(recentSearchesProvider.notifier)
                  .removeRecentSearch(query),
              onClearAll: () => ref
                  .read(recentSearchesProvider.notifier)
                  .clearRecentSearches(),
              onSearch: (query) {
                showSearch(
                  context: context,
                  delegate: BookSearchDelegate(
                    onSearch: (query) {
                      showSearch(
                        context: context,
                        delegate: BookSearchDelegate(
                          onSearch: (query) {
                            ref
                                .read(recentSearchesProvider.notifier)
                                .addRecentSearch(query);
                          },
                          initialQuery: query,
                        ),
                      );
                    },
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

class BookSearchDelegate extends SearchDelegate {
  final Function(String) onSearch;
  BookSearchDelegate({
    required this.onSearch,
    String? initialQuery,
  }) : super(
          searchFieldLabel: initialQuery ?? 'Search titles, topics or authors',
        );

  Parameters params = Parameters(category: Category.fiction);

  @override
  void showResults(BuildContext context) {
    onSearch(query);
    super.showResults(context);
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 18,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              icon: const Icon(Icons.clear, size: 20),
              onPressed: () {
                query = "";
                showSuggestions(context);
              },
            )
          : const SizedBox.square(dimension: 20),
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: colorScheme.secondary,
        titleSpacing: -8,
      ),
      primaryColor: colorScheme.primary,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.secondary,
      ),
      textTheme: theme.textTheme.copyWith(
        titleLarge: textTheme.bodyMedium!
            .copyWith(color: colorScheme.secondary), // query Color
      ),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        hintStyle: textTheme.bodyMedium!.copyWith(color: colorScheme.secondary),
        fillColor: colorScheme.primary,
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(width: 0, color: colorScheme.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(width: 0, color: colorScheme.secondary),
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final booksAsyncValue = ref.watch(searchBooksProvider(query));
        return booksAsyncValue.when(
          data: (books) {
            return ListView.separated(
              separatorBuilder: (context, index) => const Gap(8),
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  leading: Image.network(book.getImageUrl),
                  title: Text(book.title),
                  subtitle: Text(book.getAuthors),
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
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Opps! Try again later!"),
                Text('Error: $error'),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // final booksAsyncValue = ref.watch(booksFromCategoryProvider(params));
        final booksAsyncValue = ref.watch(searchBooksProvider(query));

        return booksAsyncValue.when(
          data: (books) {
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                indent: 80,
                thickness: BorderSide.strokeAlignCenter,
              ),
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  leading: Image.network(book.getImageUrl),
                  title: Text(
                    book.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    book.getAuthors,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
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
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("start typing to search for books"),
              ],
            ),
          ),
        );
      },
    );
  }
}
