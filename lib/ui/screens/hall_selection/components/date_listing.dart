import 'package:court_pro/core/extensions/date_time_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../common/text_widget.dart';
import '../../../resources/app_colors.dart';

class DateListing extends HookWidget {
  const DateListing({
    super.key,
    required this.futureDates,
    required this.currentDate,
    required this.onDateSelected,
  });

  final DateTime currentDate;
  final List<DateTime> futureDates;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    final selectedDate = useState(currentDate);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: futureDates.map((date) {
          return GestureDetector(
            onTap: () {
              selectedDate.value = date;
              onDateSelected(date);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: selectedDate.value == date
                    ? AppColors.lightBlue
                    : AppColors.unavailableSeatColor.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: TextWidget(
                title: date.parse(dateFormat: "d MMM"),
                color: selectedDate.value == date
                    ? Colors.white
                    : AppColors.darkBlue,
                size: 14,
                weight: FontWeight.w600,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
