import 'package:buuk_nuuk/utils/shared_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecentSearchesNotifier extends StateNotifier<List<String>> {
  RecentSearchesNotifier() : super([]) {
    loadRecentSearches();
  }

  Future<void> loadRecentSearches() async {
    final searches = await getRecentSearchesPref();
    state = searches;
  }

  Future<void> addRecentSearch(String query) async {
    if (query.isNotEmpty) {
      state = [
        query,
        ...state.where((item) => item != query),
      ].take(6).toList();
      saveRecentSearchesPref(state);
    }
  }

  Future<void> removeRecentSearch(String query) async {
    state = state.where((item) => item != query).toList();
    saveRecentSearchesPref(state);
  }

  Future<void> clearRecentSearches() async {
    saveRecentSearchesPref([]);
    state = [];
  }
}

final recentSearchesProvider =
    StateNotifierProvider<RecentSearchesNotifier, List<String>>(
  (ref) => RecentSearchesNotifier(),
);





// class RecentSearchesNotifier extends AsyncNotifier<List<String>> {
//   @override
//   Future<List<String>> build() async {
//     return await getRecentSearchesPref();
//   }

//   Future<void> addRecentSearch(String query) async {
//     if (query.isNotEmpty) {
//       state = AsyncValue.data([
//         query,
//         ...state.value?.where((item) => item != query) ?? [],
//       ].take(6).toList());
//       saveRecentSearchesPref(state.value!);
//     }
//   }

//   Future<void> clearRecentSearches() async {
//     saveRecentSearchesPref([]);
//     state = const AsyncValue.data([]);
//   }

//   Future<void> removeRecentSearch(String query) async {
//     state = AsyncValue.data(
//       state.value?.where((item) => item != query).toList() ?? []
//     );
//     saveRecentSearchesPref(state.value!);
//   }
// }

// final recentSearchesProvider = AsyncNotifierProvider<RecentSearchesNotifier, List<String>>(RecentSearchesNotifier.new);
