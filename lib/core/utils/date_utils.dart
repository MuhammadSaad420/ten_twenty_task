import 'package:intl/intl.dart';

class DateUtil {
  static String formatDate(String dateString) {
    final DateTime date = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat('MMMM d, y');
    return formatter.format(date);
  }
}
