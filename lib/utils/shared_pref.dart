import 'package:shared_preferences/shared_preferences.dart';

void saveRecentSearchesPref(List<String> recentSearches) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setStringList('recentSearches', recentSearches);
}

Future<List<String>> getRecentSearchesPref() async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('recentSearches') ?? [];
}



// class RecentSearchesNotifier extends StateNotifier<List<String>> {
//   RecentSearchesNotifier() : super([]) {
//     loadRecentSearches();
//   }

//   Future<void> loadRecentSearches() async {
//     final searches = await getRecentSearchesPref();
//     state = searches;
//   }

//   Future<void> addRecentSearch(String query) async {
//     if (query.isNotEmpty) {
//       state = [
//         query,
//         ...state.where((item) => item != query),
//       ].take(6).toList();
//       saveRecentSearchesPref(state);
//     }
//   }

//   Future<void> removeRecentSearch(String query) async {
//     state = state.where((item) => item != query).toList();
//     saveRecentSearchesPref(state);
//   }

//   Future<void> clearRecentSearches() async {
//     saveRecentSearchesPref([]);
//     state = [];
//   }
// }

// final recentSearchesProvider =
//     StateNotifierProvider<RecentSearchesNotifier, List<String>>(
//   (ref) => RecentSearchesNotifier(),
// );
