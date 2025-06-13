import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../resources/app_colors.dart';
import 'icon_widget.dart';
import 'text_widget.dart';

class ReservationAppBar extends HookWidget {
  const ReservationAppBar({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.2,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const IconWidget(
                icon: Icons.arrow_back_ios,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: TextWidget(
                    title: title,
                    size: 18,
                    weight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                    align: TextAlign.center,
                  ),
                ),
                const Gap(2),
                TextWidget(
                  title: subtitle,
                  size: 14,
                  weight: FontWeight.w500,
                  color: AppColors.lightBlue,
                  align: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
