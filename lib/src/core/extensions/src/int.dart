part of '../extensions.dart';

extension IntExt on int {
  SizedBox get toHeight => SizedBox(height: toDouble());
  SizedBox get toWidth => SizedBox(width: toDouble());

  /// Converts an integer representing bytes into a human-readable file size string.
  String get toReadableFileSize {
    if (this < 1024) return '$this B';
    if (this < 1048576) return '${(this / 1024).toStringAsFixed(1)} KB';
    return '${(this / 1048576).toStringAsFixed(1)} MB';
  }
}
