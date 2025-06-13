import 'package:court_pro/ui/resources/app_colors.dart';
import 'package:flutter/material.dart';

enum SeatStatus {
  selected,
  unavailable,
  vip,
  regular,
  empty,
}

extension SeatStatusExtension on SeatStatus {
  Color get color {
    switch (this) {
      case SeatStatus.selected:
        return AppColors.yellow;
      case SeatStatus.unavailable:
        return AppColors.unavailableSeatColor;
      case SeatStatus.vip:
        return AppColors.purple;
      case SeatStatus.regular:
        return AppColors.lightBlue;
      case SeatStatus.empty:
        return Colors.transparent;
    }
  }

  String get label {
    switch (this) {
      case SeatStatus.selected:
        return "Selected";
      case SeatStatus.unavailable:
        return "Unavailable";
      case SeatStatus.vip:
        return "VIP";
      case SeatStatus.regular:
        return "Regular";
      case SeatStatus.empty:
        return "";
    }
  }
}
