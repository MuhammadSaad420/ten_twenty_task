import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/enums/image_type.dart';
import '../../../../main.dart';
import '../../../../model/data/cinema_hall.dart';
import '../../../common/image_widget.dart';
import '../../../common/text_widget.dart';
import '../../../resources/app_assets.dart';
import '../../../resources/app_colors.dart';

class CinemaListing extends HookWidget {
  const CinemaListing({
    super.key,
    required this.onSelection,
  });

  final ValueChanged<CinemaHall> onSelection;

  @override
  Widget build(BuildContext context) {
    final selectedHall = useState<CinemaHall>(AppConstants.cinemaHalls.first);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: AppConstants.cinemaHalls.map((hall) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextWidget(
                    title: hall.time,
                    size: 14,
                    weight: FontWeight.w500,
                    color: AppColors.darkBlue,
                  ),
                  const Gap(8),
                  TextWidget(
                    title: loc.hall_selection_txt_cinetech_hall(hall.number),
                    size: 14,
                    weight: FontWeight.w400,
                    color: AppColors.overviewTextColor,
                  ),
                ],
              ),
              const Gap(10),
              GestureDetector(
                onTap: () {
                  selectedHall.value = hall;
                  onSelection(hall);
                },
                child: Container(
                  width: 250,
                  height: 250 / 1.5,
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: selectedHall.value.number == hall.number
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                      color: selectedHall.value.number == hall.number
                          ? AppColors.lightBlue
                          : AppColors.overviewTextColor.withOpacity(0.25),
                      width: 1.5,
                    ),
                  ),
                  child: const ImageWidget(
                    imageSrc: AppAssets.icSeating,
                    type: ImageType.asset,
                    isSvg: true,
                  ),
                ),
              ),
              const Gap(10),
              RichText(
                text: TextSpan(
                  text: "${loc.from} ",
                  style: TextStyle(
                    color: AppColors.overviewTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: "${hall.pricing.toStringAsFixed(0)}\$",
                      style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: " ${loc.from} ",
                      style: TextStyle(
                        color: AppColors.overviewTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: loc.hall_selection_txt_bonus(
                          hall.bonus.toStringAsFixed(0)),
                      style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
