import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'time_at.g.dart';

@riverpod
String timeAt(Ref ref, DateTime time) {
  int hour = time.hour;
  int minute = time.minute;

  String formattedHour = hour.toString().padLeft(2, '0');
  String formattedMinute = minute.toString().padLeft(2, '0');

  String timeString = '$formattedHour:$formattedMinute';

  return timeString;
}
