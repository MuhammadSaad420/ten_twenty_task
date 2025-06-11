import 'package:flutter/material.dart';

import '../resources/app_dimension.dart';
import 'icon_widget.dart';
import 'text_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.title, this.onLeadingPressed});
  final String title;
  final VoidCallback? onLeadingPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconWidget(
        icon: Icons.arrow_back_ios_new_rounded,
        color: Theme.of(context).colorScheme.onSurface,
        onIconTap: onLeadingPressed ?? () => Navigator.of(context),
      ),
      title: TextWidget(title: title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppDimension.toolbarHeight);
}
