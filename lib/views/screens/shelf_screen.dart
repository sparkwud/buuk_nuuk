import 'package:buuk_nuuk/utils/app_drawables.dart';
import 'package:buuk_nuuk/utils/pallete.dart';
import 'package:buuk_nuuk/views/screens/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:buuk_nuuk/models/book_model.dart';
import 'package:buuk_nuuk/utils/text_theme.dart';

class ShelfScreen extends StatefulWidget {
  const ShelfScreen({super.key});

  @override
  ShelfScreenState createState() => ShelfScreenState();
}

class ShelfScreenState extends State<ShelfScreen> {
  // This would typically be managed by a state management solution
  // For this example, we'll use a mock list of favorited books
  List<Book> favoritedBooks = [
    Book(
      title: "The Great Gatsby",
      authors: ["F. Scott Fitzgerald"],
      description: "A novel about the American Dream.",
      // getImageUrl: "https://example.com/great_gatsby.jpg",
      pageCount: 180,
    ),
    Book(
      title: "To Kill a Mockingbird",
      authors: ["Harper Lee"],
      description: "A story of racial injustice and loss of innocence.",
      // getImageUrl: "https://example.com/to_kill_a_mockingbird.jpg",
      pageCount: 281,
    ),
    // Add more books as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shelf",
          style: textTheme.displayMedium!.copyWith(
            color: colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: favoritedBooks.isEmpty ? _buildEmptyShelf() : _buildBookList(),
    );
  }

  Widget _buildEmptyShelf() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.book_outlined, size: 100, color: Colors.grey),
          const SizedBox(height: 20),
          Text(
            'Your shelf is empty',
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Text(
            'Add books to your favorites to see them here',
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBookList() {
    return ListView.builder(
      itemCount: favoritedBooks.length,
      itemBuilder: (context, index) {
        final book = favoritedBooks[index];
        return Dismissible(
          key: Key(book.title),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
              favoritedBooks.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${book.title} removed from shelf')),
            );
          },
          child: ListTile(
            leading: Hero(
              tag: book,
              child: Image.network(
                book.getImageUrl,
                width: 50,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(book.title, style: textTheme.titleMedium),
            subtitle: Text(book.authors?.join(', ') ?? 'Unknown Author'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsScreen(bookDetails: book),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
