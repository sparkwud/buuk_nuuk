import 'package:buuk_nuuk/models/book_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShelfNotifier extends StateNotifier<List<Book>> {
  ShelfNotifier() : super([]);

  void addBook(Book book) {
    if (!state.contains(book)) {
      state = [...state, book];
    }
  }

  void removeBook(Book book) {
    state = state.where((b) => b.title != book.title).toList();
  }

  bool isBookInShelf(Book book) {
    return state.any((b) => b.title == book.title);
  }
}

final shelfProvider = StateNotifierProvider<ShelfNotifier, List<Book>>((ref) {
  return ShelfNotifier();
});
