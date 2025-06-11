import 'package:flutter/material.dart';

import '../../../../../../resources/app_colors.dart';

class CatergoryCard extends StatelessWidget {
  const CatergoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.darkGrey,
      ),
    );
  }
}
