String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  if (duration.inHours > 0) {
    return '$hours:$minutes:$seconds';
  } else {
    return '$minutes:$seconds';
  }
}
