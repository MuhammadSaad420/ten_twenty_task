import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../main.dart';
import '../../../../model/data/upcoming_movie_response.dart';
import '../../../common/text_widget.dart';
import '../../../resources/app_colors.dart';
import 'genre_chip.dart';

class MovieDecription extends StatelessWidget {
  const MovieDecription({
    super.key,
    required this.movie,
  });

  final Movie movie;

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
          Wrap(
            spacing: 5,
            children: movie.genres!
                .map((genre) => GenreChip(
                      title: genre.name.label,
                      bgColor: genre.name.color,
                    ))
                .toList(),
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
            title: movie.overview,
            size: 12,
            color: AppColors.overviewTextColor,
          )
        ],
      ),
    );
  }
}
