import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'format_time.g.dart';

String formatTimeAgo(DateTime createdAt) {
  // Вычисляем разницу между текущим временем и переданным временем в прошлом
  final difference = DateTime.now().difference(createdAt);

  if (difference.inSeconds < 10) {
    return 'now'.hardcoded;
  } else if (difference.inSeconds < 60) {
    return '${difference.inSeconds} sec'.hardcoded;
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} min'.hardcoded;
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours';
  } else if (difference.inDays < 7) {
    final int days = difference.inDays;
    if (days == 1) {
      return 'yesterday'.hardcoded;
    }
    return '${difference.inDays} days';
  } else {
    final String day = createdAt.day.toString().padLeft(2, '0');
    final String month = createdAt.month.toString().padLeft(2, '0');
    final String year = createdAt.year.toString();

    return '$day.$month.$year';
  }
}

@riverpod
String Function(DateTime) formatTime(Ref ref) => formatTimeAgo;
