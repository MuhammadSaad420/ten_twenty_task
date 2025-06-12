import 'package:court_pro/core/enums/image_type.dart';
import 'package:court_pro/core/utils/image_utils.dart';
import 'package:court_pro/model/data/movies_response.dart';
import 'package:court_pro/ui/common/image_widget.dart';
import 'package:court_pro/ui/common/text_widget.dart';
import 'package:court_pro/ui/resources/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../../../resources/app_colors.dart';

class WatchCard extends StatelessWidget {
  const WatchCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.movieDetailsRoute,
            arguments: movie.id);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 180,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ImageWidget(
                imageSrc: ImageUtils.getPosterUrl(movie.posterPath),
                type: ImageType.network,
                cache: true,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black54,
                    Colors.black12,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: TextWidget(
                title: movie.originalTitle,
                size: 18,
                weight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
