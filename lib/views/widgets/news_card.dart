import 'package:buuk_nuuk/utils/app_drawables.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String author;
  final double rating;

  const NewsCard({
    super.key,
    required this.title,
    required this.author,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 50,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: const DecorationImage(
            image: NetworkImage(AppImages.errorLink),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      subtitle: Text(author),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, color: Colors.yellow),
          const Gap(5),
          Text(rating.toString(), style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
