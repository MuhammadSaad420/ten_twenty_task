import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../main.dart';
import '../../../common/text_widget.dart';
import '../../../resources/app_colors.dart';
import 'genre_chip.dart';

class MovieDecription extends StatelessWidget {
  const MovieDecription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 27, 30, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextWidget(
            title: loc.movie_details_txt_genres,
            size: 18,
            weight: FontWeight.w500,
          ),
          const Gap(5),
          const Wrap(
            children: [
              GenreChip(),
              GenreChip(),
              GenreChip(),
            ],
          ),
          const Gap(5),
          const Divider(
            thickness: 0.3,
          ),
          const Gap(5),
          TextWidget(
            title: loc.movie_details_txt_overview,
            size: 18,
            weight: FontWeight.w500,
          ),
          const Gap(14),
          TextWidget(
            title:
                "As a collection of history's worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them. Discover the origins of the very first independent intelligence agency in The King's Man. The Comic Book “The Secret Service” by Mark Millar and Dave Gibbons.",
            size: 12,
            color: AppColors.overviewTextColor,
          )
        ],
      ),
    );
  }
}
