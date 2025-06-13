import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../common/icon_widget.dart';
import '../../../resources/app_colors.dart';

class SelectedSeatChip extends StatelessWidget {
  const SelectedSeatChip({
    super.key,
    required this.selectedSeat,
    required this.onTap,
  });

  final (int, int) selectedSeat;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final (row, col) = selectedSeat;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.unavailableSeatColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  text: "${col + 1}  /",
                  style: TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: " ${row + 1} row",
                      style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
            const Gap(15),
            const IconWidget(
              icon: Icons.close,
              iconSize: 14,
            )
          ],
        ),
      ),
    );
  }
}
