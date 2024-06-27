import 'package:buuk_nuuk/api/books_service.dart';
import 'package:buuk_nuuk/models/book_model.dart';
import 'package:buuk_nuuk/models/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// typedef Params = ({Category category, int maxResult});
// Params createParams({required Category category, int maxResult = 11}) {
//   return (category: category, maxResult: maxResult);
// }

class Parameters {
   Category category;
   int maxResult;
  Parameters({
    required this.category,
    this.maxResult = 11,
  });
}

final booksServiceProvider = Provider<BooksService>((ref) {
  return BooksService();
});

final searchBooksProvider =
    FutureProvider.family<List<Book>, String>((ref, query) async {
  final booksService = ref.read(booksServiceProvider);
  return booksService.searchBooks(query);
});

final bookDetailsProvider =
    FutureProvider.family<Book, String>((ref, id) async {
  final booksService = ref.read(booksServiceProvider);
  return booksService.getDetailsFromId(id);
});

final booksFromCategoryProvider =
    FutureProvider.family<List<Book>, Parameters>((ref, parameters) async {
  final booksService = ref.read(booksServiceProvider);
  return booksService.getBooksFromCategory(
    category: parameters.category,
    maxResult: parameters.maxResult,
  );
});
