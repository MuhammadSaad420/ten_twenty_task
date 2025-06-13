import 'package:intl/intl.dart';

class DateUtil {
  static String formatStringDate(String dateString,
      {String dateFormat = 'MMMM d, y'}) {
    final DateTime date = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat(dateFormat);
    return formatter.format(date);
  }

  static List<DateTime> generateDates(
      {required DateTime startDate, int days = 30}) {
    return List.generate(days, (index) => startDate.add(Duration(days: index)));
  }

  static DateTime stringToDate(String dateString,
      {String dateFormat = 'MMMM d, y'}) {
    return DateTime.parse(dateString);
  }
}
