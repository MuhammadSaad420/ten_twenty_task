import 'package:court_pro/ui/resources/app_colors.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

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
        return loc.selected;
      case SeatStatus.unavailable:
        return loc.not_available;
      case SeatStatus.vip:
        return loc.vip;
      case SeatStatus.regular:
        return loc.regular;
      case SeatStatus.empty:
        return "";
    }
  }

  double? get price {
    switch (this) {
      case SeatStatus.selected:
        return null;
      case SeatStatus.unavailable:
        return null;
      case SeatStatus.vip:
        return 150;
      case SeatStatus.regular:
        return 50;
      case SeatStatus.empty:
        return null;
    }
  }
}
