import 'package:court_pro/core/enums/image_type.dart';
import 'package:court_pro/core/enums/site_type.dart';
import 'package:court_pro/core/enums/video_type.dart';
import 'package:court_pro/core/utils/image_utils.dart';
import 'package:court_pro/core/utils/toast_utils.dart';
import 'package:court_pro/model/data/movies_response.dart';
import 'package:court_pro/ui/common/image_widget.dart';
import 'package:court_pro/ui/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/enums/toast_type.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../main.dart';
import '../../../../providers/movie_provider.dart';
import '../../../common/icon_widget.dart';
import '../../../common/main_button.dart';
import '../../../common/outlined_button.dart';
import '../../../common/text_widget.dart';
import '../../../resources/app_colors.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final movieProvider = context.read<MovieProvider>();
    return Stack(
      alignment: Alignment.center,
      children: [
        _poster(screenHeight),
        _back(context),
        Positioned(
          bottom: 0,
          child: Column(
            children: [
              TextWidget(
                title: loc.movie_details_txt_in_theatre(
                    DateUtil.formatDate(movie.releaseDate)),
                color: Colors.white,
                size: 18,
                weight: FontWeight.w500,
              ),
              const Gap(10),
              MainButton(
                title: loc.movie_details_btn_get_tickets,
                buttonColor: AppColors.lightBlue,
                textColor: Colors.white,
                btnWidth: screenWidth * 0.7,
                onPressed: () {},
              ),
              const Gap(10),
              OutlineButtonWidget(
                title: loc.movie_details_btn_watch_trailer,
                btnWidth: screenWidth * 0.7,
                onTap: () {
                  final availableTrailers = movieProvider.trailers;
                  final youtubeTrailers = availableTrailers
                      .where(
                        (trailer) =>
                            trailer.site == SiteType.youtube.label &&
                            trailer.type == VideoType.trailer.label,
                      )
                      .toList();
                  if (youtubeTrailers.isNotEmpty) {
                    Navigator.pushNamed(context, AppRoutes.trailer,
                        arguments: youtubeTrailers.first.key);
                  } else {
                    ToastUtils.show(
                        msg: loc.msg_no_trailer_available,
                        type: ToastType.message);
                  }
                },
              ),
              const Gap(30)
            ],
          ),
        )
      ],
    );
  }

  Stack _poster(double screenHeight) {
    return Stack(
        children: [
          SizedBox(
            height: screenHeight * 0.6,
            child: Stack(
              children: [
                ImageWidget(
                  imageSrc: ImageUtils.getPosterUrl(movie.posterPath),
                  type: ImageType.network,
                  cache: true,
                  imgWidth: double.infinity,
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
              ],
            ),
          ),
        ],
      );
  }

  Positioned _back(BuildContext context) {
    return Positioned(
        top: 59,
        left: 13,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              const IconWidget(
                icon: Icons.arrow_back_ios,
                color: Colors.white,
              ),
              TextWidget(
                title: loc.dashboard_bn_watch,
                color: Colors.white,
                size: 16,
                weight: FontWeight.w500,
              )
            ],
          ),
        ),
      );
  }
}
