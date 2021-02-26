class MyTimer {
  String duration(DateTime timestamp) {
    String x;
    final time = timestamp.toUtc();
    final now = DateTime.now();
    final difference = now.difference(time).inDays;
    final hdif = now.difference(time).inHours;
    if (hdif > 24) {
      x = '${difference} days ago';
    } else {
      x = '${hdif} hours ago';
    }
    return x;
  }
}
