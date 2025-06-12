import 'package:flutter/material.dart';

import '../../../common/text_widget.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({
    super.key,
    required this.title,
    required this.bgColor,
  });

  final String title;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: TextWidget(
        title: title,
        color: Colors.white,
        size: 12,
      ),
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
      backgroundColor: bgColor,
      shape: const StadiumBorder(),
      side: BorderSide.none,
    );
  }
}
