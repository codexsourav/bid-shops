class TimeStamp {
  int? year;
  int? month;
  int? day;
  int? hour;
  int? minute;
  int? second;
  String? amPm;
  int? hour12;

  TimeStamp(timestamp) {
    try {
      DateTime dateTime = DateTime.parse(timestamp);
      year = dateTime.year;
      month = dateTime.month;
      day = dateTime.day;
      hour = dateTime.hour;
      minute = dateTime.minute;
      second = dateTime.second;
      hour12 = hour! % 12 == 0 ? 12 : hour! % 12;
      amPm = dateTime.hour < 12 ? 'AM' : 'PM';
    } catch (e) {
      rethrow;
    }
  }
}
