abstract class DateHelper {
  static String formatDate(DateTime date) {
    final difference = DateTime.now().difference(date);

    if (difference.inDays == 0) {
      return 'اليوم';
    } else if (difference.inDays == 1) {
      return 'أمس';
    } else if (difference.inDays < 7) {
      return 'منذ ${difference.inDays} أيام';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  static String formatTime12Hour(DateTime date) {
    int hour = date.hour;
    final period = hour >= 12 ? 'م' : 'ص';

    if (hour > 12) {
      hour = hour - 12;
    } else if (hour == 0) {
      hour = 12;
    }

    final hourString = hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hourString:$minute $period';
  }
}
