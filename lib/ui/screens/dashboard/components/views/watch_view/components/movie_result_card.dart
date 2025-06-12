import 'package:court_pro/core/enums/genre_type.dart';
import 'package:court_pro/core/enums/image_type.dart';
import 'package:court_pro/core/utils/image_utils.dart';
import 'package:court_pro/model/data/genre_model.dart';
import 'package:court_pro/providers/movie_provider.dart';
import 'package:court_pro/ui/common/image_widget.dart';
import 'package:court_pro/ui/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../../../model/data/movies_response.dart';
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
    final screenWidth = MediaQuery.sizeOf(context).width;
    final movieProvider = context.read<MovieProvider>();
    final movieGenre = movieProvider.genres.firstWhere(
        (genre) => movie.genreIds!.contains(genre.id),
        orElse: () => const Genre(id: 0, name: GenreType.action));
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(AppRoutes.movieDetailsRoute, arguments: movie.id),
      child: Row(
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ImageWidget(
                    imageSrc: ImageUtils.getPosterUrl(movie.posterPath),
                    type: ImageType.network,
                    cache: true,
                  ),
                ),
              ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth * 0.4,
                    child: TextWidget(
                      title: movie.title,
                      size: 16,
                      weight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Gap(8),
                  TextWidget(
                    title: movieGenre.name.label,
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
      ),
    );
  }
}
