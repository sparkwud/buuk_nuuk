import 'package:buuk_nuuk/utils/app_drawables.dart';
import 'package:buuk_nuuk/utils/context_extension.dart';
import 'package:buuk_nuuk/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCover3D extends StatefulWidget {
  final String? imageUrl;
  final String? title;
  final String? author;
  final Color? titleColor;
  const BookCover3D({
    super.key,
    this.imageUrl,
    this.title,
    this.author,
    this.titleColor,
  });

  @override
  State<BookCover3D> createState() => _BookCover3DState();
}

class _BookCover3DState extends State<BookCover3D> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 100,
      // height: 200,
      width: context.width * 0.3,
      // height: context.width * 0.4,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(2, 2, 0.001)
          ..rotateY(0.25),
        alignment: FractionalOffset.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(2.0, 4.0),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    widget.imageUrl ?? AppImages.errorLink,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            const Gap(12),
            Text(
              widget.title ?? "title...",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: widget.titleColor ?? colorScheme.secondary,
                    fontSize: context.width * 0.035,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Text(
              widget.author ?? "authors...",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    // color: colorScheme.secondary,
                    fontSize: context.width * 0.03,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
