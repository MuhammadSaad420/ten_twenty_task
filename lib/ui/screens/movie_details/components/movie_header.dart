import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../main.dart';
import '../../../common/icon_widget.dart';
import '../../../common/main_button.dart';
import '../../../common/outlined_button.dart';
import '../../../common/text_widget.dart';
import '../../../resources/app_colors.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: screenHeight * 0.6,
          decoration: const BoxDecoration(color: Colors.red),
        ),
        Positioned(
          top: 59,
          left: 13,
          child: Row(
            children: [
              const InkWell(
                child: IconWidget(
                  icon: Icons.arrow_back_ios,
                  color: Colors.white,
                ),
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
        Positioned(
          bottom: 0,
          child: Column(
            children: [
              const TextWidget(
                title: "In Theatres December 21, 2021",
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
                onTap: () {},
              ),
              const Gap(30)
            ],
          ),
        )
      ],
    );
  }
}
