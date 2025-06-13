import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/enums/seat_status.dart';
import '../../../common/text_widget.dart';
import '../../../resources/app_colors.dart';
import 'seat_widget.dart';

class SeatsInfo extends StatelessWidget {
  const SeatsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getSeatDescription(seatStatus: SeatStatus.selected),
            const Gap(15),
            _getSeatDescription(seatStatus: SeatStatus.vip),
          ],
        ),
        const Gap(50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getSeatDescription(seatStatus: SeatStatus.unavailable),
            const Gap(15),
            _getSeatDescription(seatStatus: SeatStatus.regular),
          ],
        )
      ],
    );
  }
}

Row _getSeatDescription({required SeatStatus seatStatus}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SeatWidget(
        seatStatus: seatStatus,
        width: 21,
        height: 16,
      ),
      const Gap(5),
      TextWidget(
        title:
            "${seatStatus.label} ${seatStatus.price != null ? "(${seatStatus.price!.toStringAsFixed(0)} \$)" : ""}",
        size: 13,
        weight: FontWeight.w500,
        color: AppColors.overviewTextColor,
      )
    ],
  );
}
