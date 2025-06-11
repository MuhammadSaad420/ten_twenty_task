import 'package:flutter/material.dart';

import '../../../../../../resources/app_colors.dart';

class WatchCard extends StatelessWidget {
  const WatchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.darkGrey,
      ),
    );
  }
}
