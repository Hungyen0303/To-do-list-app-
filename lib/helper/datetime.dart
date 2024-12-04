import 'package:intl/intl.dart';

class DateTimeHelper {
  static String getTodayAsString() {
    DateTime now = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(now);
  }

  static String getSomeNextDay(int day) /**/ {
    DateTime someday = DateTime.now().add(Duration(days: day));
    return DateFormat('yyyy-MM-dd').format(someday);
  }

  static String getTimeAsString() {
    DateTime time = DateTime.now();
    return DateFormat('HH:mm').format(time);
  }

  static String getSomeTimeAsString(int minute) {
    DateTime sometime = DateTime.now().add(Duration(minutes: minute));
    return DateFormat('HH:mm').format(sometime);
  }
}
