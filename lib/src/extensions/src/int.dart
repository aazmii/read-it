part of '../extensions.dart';

extension IntExt on int {
  SizedBox get toHeight => SizedBox(height: toDouble());
  SizedBox get toWidth => SizedBox(width: toDouble());
}
