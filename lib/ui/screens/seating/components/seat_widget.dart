import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/enums/seat_status.dart';

class SeatWidget extends StatelessWidget {
  const SeatWidget({
    super.key,
    required this.seatStatus,
    this.scale = 1,
    required this.width,
    required this.height,
  });

  final double scale;
  final SeatStatus seatStatus;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: width * scale,
            height: height * scale,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: seatStatus.color,
            ),
          ),
          const Gap(0.5),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: (width / 1.7) * scale,
            height: (height / 5) * scale,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: seatStatus.color,
            ),
          ),
        ],
      ),
    );
  }
}
