import 'package:flutter/material.dart';

import '../../../common/text_widget.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 5),
      child: Chip(
        label: TextWidget(
          title: "Action",
          color: Colors.white,
          size: 12,
        ),
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 14),
        backgroundColor: Colors.red,
        shape: StadiumBorder(),
        side: BorderSide.none,
      ),
    );
  }
}
