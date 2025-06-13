import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/enums/image_type.dart';
import '../../../../core/enums/seat_status.dart';
import '../../../../main.dart';
import '../../../common/image_widget.dart';
import '../../../common/text_widget.dart';
import '../../../resources/app_assets.dart';
import '../../../resources/app_colors.dart';
import 'seat_widget.dart';

class SeatingWidget extends StatelessWidget {
  const SeatingWidget({
    super.key,
    this.scale = 1,
    this.selectedSeat,
    required this.onSeatTap,
  });

  final double scale;
  final (int, int)? selectedSeat;
  final Function((int, int)?) onSeatTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  bottom: 10,
                  child: TextWidget(
                    title: loc.screen,
                    size: 8,
                    weight: FontWeight.w500,
                    color: AppColors.overviewTextColor,
                  )),
              const ImageWidget(
                imageSrc: AppAssets.icScreenCurve,
                type: ImageType.asset,
                isSvg: true,
              ),
            ],
          ),
          const Gap(10),
          ...List.generate(
            AppConstants.seats.length,
            (rowIndex) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    SizedBox(
                      width: 6 * scale + 3,
                      child: TextWidget(
                        title: "${rowIndex + 1}",
                        size: 6 * scale,
                        weight: FontWeight.w700,
                      ),
                    ),
                    const Gap(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          AppConstants.seats[rowIndex].length, (columnIndex) {
                        final currentSeat =
                            AppConstants.seats[rowIndex][columnIndex];
                        return GestureDetector(
                          onTap: () {
                            if (currentSeat == SeatStatus.regular ||
                                currentSeat == SeatStatus.vip) {
                              onSeatTap((rowIndex, columnIndex));
                            }
                            if ((rowIndex, columnIndex) == selectedSeat) {
                              onSeatTap(null);
                            }
                          },
                          child: SeatWidget(
                            scale: scale,
                            seatStatus: (rowIndex, columnIndex) == selectedSeat
                                ? SeatStatus.selected
                                : currentSeat,
                            width: 7,
                            height: 5,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
