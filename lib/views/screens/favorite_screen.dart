import 'package:buuk_nuuk/utils/app_drawables.dart';
import 'package:buuk_nuuk/utils/pallete.dart';
import 'package:buuk_nuuk/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourite",
          style: textTheme.displayMedium!.copyWith(color: colorScheme.primary),
        ),
        // backgroundColor: Colors.white,
        elevation: 0,

        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 150.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage(AppImages.errorLink),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Failed It!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Row(
                          children: [
                            Text(
                              '5.0',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.star, color: Colors.yellow, size: 24),
                          ],
                        ),
                        const Text('Erik Kessels'),
                        const Row(
                          children: [
                            Chip(label: Text('Self-help')),
                            Gap(8),
                            Chip(label: Text('Classic')),
                          ],
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(),
                              child: const Text('Buy \$13.99'),
                            ),
                            const Gap(8),
                            IconButton(
                              icon: const Icon(Icons.bookmark_border),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(20),
              const Text(
                'Best Author',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              const Column(
                children: [
                  AuthorCard(name: 'George Martin', books: 26),
                  AuthorCard(name: 'Stephen King', books: 56),
                  AuthorCard(name: 'Neil Gaiman', books: 16),
                ],
              ),
              const Gap(20),
              const Text(
                'Liked books',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    LikedBookCard(
                      imageUrl: AppImages.errorLink,
                    ),
                    LikedBookCard(
                      imageUrl: AppImages.errorLink,
                    ),
                    LikedBookCard(
                      imageUrl: AppImages.errorLink,
                    ),
                    LikedBookCard(
                      imageUrl: AppImages.errorLink,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthorCard extends StatelessWidget {
  final String name;
  final int books;

  const AuthorCard({super.key, required this.name, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://via.placeholder.com/50'),
      ),
      title: Text(name, style: const TextStyle(fontSize: 18)),
      subtitle: Text('$books Books'),
      trailing: const Icon(Icons.more_vert),
    );
  }
}

class LikedBookCard extends StatelessWidget {
  final String imageUrl;

  const LikedBookCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
