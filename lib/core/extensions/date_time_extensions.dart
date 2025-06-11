import 'package:intl/intl.dart';

extension ParseDateTime on DateTime {
  String parse({required String dateFormat}) {
    return DateFormat(dateFormat).format(this);
  }

  DateTime firstDateOfMonth() {
    return DateTime(year, month, 1);
  }

  DateTime lastDateOfMonth() {
    return DateTime(year, month + 1, 0);
  }
}
