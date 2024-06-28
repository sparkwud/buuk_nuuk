import 'package:buuk_nuuk/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailsWidget extends StatelessWidget {
  final String author;
  final String publisher;
  final String publishedDate;
  final String category;

  const BookDetailsWidget({
    super.key,
    required this.author,
    required this.publisher,
    required this.publishedDate,
    required this.category,
  });

  TableRow _buildTableRow(
    String label,
    String value, {
    bool isFirst = false,
    bool isLast = false,
  }) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: isFirst ? 0 : 2.0,
            bottom: isLast ? 0 : 2.0,
            right: 8.0,
          ),
          child: Text(
            label,
            style: textTheme.headlineMedium,
          ),
        ),
        // const Gap(1),

        Padding(
          padding: EdgeInsets.only(
            top: isFirst ? 0 : 2.0,
            bottom: isLast ? 0 : 2.0,
            left: 8.0,
          ),
          child: Text(
            value,
            style: textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Details',
          style: textTheme.displayMedium,
        ),
        const Gap(8),
        Table(
          columnWidths: const {
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
          },
          children: [
            _buildTableRow('Author(s)', author, isFirst: true),
            _buildTableRow('Publisher', publisher),
            _buildTableRow('Published Date', publishedDate),
            _buildTableRow('Category(s)', category, isLast: true),
          ],
        ),
        // const Gap(16),
        // BookDetailRow(label: 'Author(s)', value: author),
        // BookDetailRow(label: 'Publisher', value: publisher),
        // BookDetailRow(label: 'Published Date', value: publishedDate),
        // BookDetailRow(label: 'Category(s)', value: category),
      ],
    );
  }
}

class BookDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const BookDetailRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                label,
                style: textTheme.headlineMedium,
              ),
            ],
          ),
          const Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
