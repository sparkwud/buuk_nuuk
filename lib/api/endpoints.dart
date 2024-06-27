class Endpoints {
  Endpoints._();

  static const _baseUrl = "www.googleapis.com";

  static Uri search({
    required String query,
    int maxResult = 11,
  }) =>
      Uri.https(_baseUrl, "/books/v1/volumes", {
        'q': query,
        'maxResults': maxResult.toString(),
      });

  static Uri searchCategory({
    required String query,
    int maxResult = 11,
  }) =>
      Uri.https(_baseUrl, "/books/v1/volumes", {
        'q': "+subject:$query",
        'maxResults': maxResult.toString(),
      });

  static Uri searchAuthor({
    required String authorName,
    int maxResult = 11,
  }) =>
      Uri.https(_baseUrl, "/books/v1/volumes", {
        'q': "inauthor:$authorName",
        'maxResults': maxResult.toString(),
      });

  static Uri details({required String id}) =>
      Uri.https(_baseUrl, "/books/v1/volumes/$id");
}
