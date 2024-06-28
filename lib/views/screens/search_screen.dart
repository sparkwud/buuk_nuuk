import 'package:buuk_nuuk/models/category_model.dart';
import 'package:buuk_nuuk/providers/book_service_providers.dart';
import 'package:buuk_nuuk/views/screens/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends SearchDelegate {

  
  String errorLink =
      // "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTMI5yf9vYw85Q9Qr4kI3HH-qHdza7Gzp5HQ&s";

  Parameters params = Parameters(category: Category.fiction);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final booksAsyncValue = ref.watch(searchBooksProvider(query));
        return booksAsyncValue.when(
          data: (books) {
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  leading:
                      Image.network(book.imageLinks?.thumbnail ?? errorLink),
                  title: Text(book.title),
                  subtitle: Text(book.authors?.join(',') ?? "no authors found"),
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
        final booksAsyncValue = ref.watch(booksFromCategoryProvider(params));
        return booksAsyncValue.when(
          data: (books) {
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  leading:
                      Image.network(book.imageLinks?.thumbnail ?? errorLink),
                  title: Text(book.title),
                  subtitle: Text(book.authors?.join(',') ?? "no authors found"),
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
}
