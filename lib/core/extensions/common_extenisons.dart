import 'package:flutter/material.dart';

import '../../ui/resources/app_colors.dart';
import '../enums/toast_type.dart';

extension ToastColor on ToastType {
  Color getColor() {
    return this == ToastType.message
        ? AppColors.primaryColor
        : this == ToastType.error
            ? Colors.red
            : Colors.green;
  }
}

extension BoolExtension on bool {
  bool not() {
    return !this;
  }
}

extension NullEmptyFalseExtension on Object? {
  bool isNull() {
    return this == null;
  }

  bool isNullOrEmpty() {
    return this == Null || toString().isEmpty;
  }
}

extension DoubleExtension on double {
  double truncateToOneDecimal() {
    return (this * 10).floor() / 10;
  }
}


extension LocalizationReminderExtension on String {
  String get hardcoded {
    return this;
  }
}
