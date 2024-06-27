import 'package:buuk_nuuk/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCard extends StatelessWidget {
  final String? title;
  final String? imageUrl;

  const BookCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(imageUrl!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Gap(5),
        Text(
          title!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.headlineMedium,
        ),
      ],
    );
  }
}
