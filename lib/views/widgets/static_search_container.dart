import 'package:buuk_nuuk/utils/app_drawables.dart';
import 'package:buuk_nuuk/utils/pallete.dart';
import 'package:buuk_nuuk/utils/widget_extensions.dart';
import 'package:buuk_nuuk/views/screens/search_screen.dart';
import 'package:flutter/material.dart';

class StaticSearchContainer extends StatelessWidget {
  const StaticSearchContainer({
    super.key,
    this.hint = "Search for books",
    this.onTap,
    this.color,
    required this.onSearch,
  });
  final String hint;
  final VoidCallback? onTap;
  final Color? color;
  final Function(String) onSearch;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            showSearch(
              context: context,
              delegate: BookSearchDelegate(
                onSearch: onSearch,
              ),
            );
          },
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            // color: appColors.black,
            color: color ?? colorScheme.primary,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hint,
              style: TextStyle(
                color: color ?? colorScheme.primary,
              ),
            ),
            AppIcons.icSearch.svgPicture(color: color ?? colorScheme.primary),
          ],
        ),
      ),
    );
  }
}
