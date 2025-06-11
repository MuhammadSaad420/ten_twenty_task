import 'package:flutter/material.dart';

import '../resources/app_dimension.dart';
import 'icon_widget.dart';
import 'text_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.onLeadingPressed,
  });
  final String title;
  final VoidCallback? onLeadingPressed;

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [],
    );
  }
}
