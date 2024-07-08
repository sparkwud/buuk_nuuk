import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;
  final TextStyle? style;
  final String trimExpandedText;
  final String trimCollapsedText;
  final TextStyle? trimStyle;
  final Color trimColor;

  const ExpandableText({
    super.key,
    required this.text,
    this.trimLines = 4,
    this.style,
    this.trimCollapsedText = "Read more",
    this.trimExpandedText = "Read less",
    this.trimStyle,
    this.trimColor = Colors.grey,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;

  @override
  Widget build(BuildContext context) {
    final span = TextSpan(
      text: widget.text,
      style: widget.style,
    );

    final tp = TextPainter(
      text: span,
      maxLines: widget.trimLines,
      textDirection: TextDirection.ltr,
    );

    tp.layout(maxWidth: MediaQuery.of(context).size.width);

    final link = Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _readMore = !_readMore;
          });
        },
        child: Text(
          _readMore ? widget.trimCollapsedText : widget.trimExpandedText,
          style: widget.trimStyle ??
              TextStyle(
                color: widget.trimColor,
                fontSize: 13,
              ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: _readMore && tp.didExceedMaxLines
              ? Text(
                  widget.text,
                  maxLines: widget.trimLines,
                  overflow: TextOverflow.ellipsis,
                  style: widget.style,
                )
              : Text(
                  widget.text,
                  style: widget.style,
                ),
        ),
        if (tp.didExceedMaxLines) link,
      ],
    );
  }
}
