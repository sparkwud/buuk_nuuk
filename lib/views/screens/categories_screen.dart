import 'package:buuk_nuuk/models/category_model.dart';
import 'package:buuk_nuuk/utils/pallete.dart';
import 'package:buuk_nuuk/utils/text_theme.dart';
import 'package:buuk_nuuk/views/screens/category_items_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Categories",
          style: textTheme.displayMedium!.copyWith(
            color: colorScheme.primary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: GridView.builder(
          // physics: const BouncingScrollPhysics(),
          itemCount: Category.values.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              category: Category.values[index],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryItemScreen(category: Category.values[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
