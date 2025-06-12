import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../model/data/upcoming_movie_response.dart';
import '../../../../../../common/icon_widget.dart';
import '../../../../../../common/text_widget.dart';
import '../../../../../../resources/app_colors.dart';

class MovieResultCard extends StatelessWidget {
  const MovieResultCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 100,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.darkGrey,
              ),
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  title: movie.title,
                  size: 16,
                  weight: FontWeight.w500,
                ),
                const Gap(8),
                TextWidget(
                  title: "Fantasy",
                  size: 12,
                  weight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ],
            ),
          ],
        ),
        IconWidget(
          icon: Icons.more_horiz,
          color: AppColors.lightBlue,
        ),
      ],
    );
  }
}
