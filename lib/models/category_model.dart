enum Category {
  fiction(
    title: "Fiction",
    query: "fiction",
    imageUrl:
        "https://images.unsplash.com/photo-1474932430478-367dbb6832c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmljdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
  ),
  classic(
    title: "Classic",
    query: "classic",
    imageUrl:
        "https://images.unsplash.com/photo-1600181982553-ce7d36051c01?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fHw%3D",
  ),
  novel(
    title: "Novel",
    query: "novel",
    imageUrl:
        "https://images.unsplash.com/photo-1585849837997-ac13cb616ff7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fG5vdmVsfGVufDB8fDB8fHww",
  ),
  romance(
    title: "Romance",
    query: "romance",
    imageUrl:
        // "https://images.unsplash.com/photo-1474552226712-ac0f0961a954?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cm9tYW5jZSUyMGJvb2tzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        "https://images.unsplash.com/photo-1638277294704-507f355ce75e?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  comic(
    title: "Comic",
    query: "comic",
    imageUrl:
        "https://images.unsplash.com/photo-1608889476561-6242cfdbf622?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Y29taWN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  ),

  history(
    title: "History",
    query: "history",
    imageUrl:
        "https://images.unsplash.com/photo-1613324766451-2d03b2ea8190?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  horror(
    title: "Horror",
    query: "horror",
    imageUrl:
        "https://images.unsplash.com/photo-1542691646-b06e145f7a95?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8aG9ycm9yJTIwYm9va3N8ZW58MHx8MHx8fDA%3D",
  ),
  crime(
    title: "Crime",
    query: "crime",
    imageUrl:
        "https://images.unsplash.com/photo-1625449281218-cbb6183f0aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y3JpbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  ),
  mystery(
    title: "Mystery",
    query: "mystery",
    imageUrl:
        "https://images.unsplash.com/photo-1419640303358-44f0d27f48e7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fHw%3D",
  ),
  fantasy(
    title: "Fantasy",
    query: "fantasy",
    imageUrl:
        "https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MjB8cnhNaGlxdmZpRGd8fGVufDB8fHx8fA%3D%3D",
  );

  const Category({
    required this.title,
    required this.query,
    required this.imageUrl,
  });
  final String title;
  final String query;
  final String imageUrl;
}
