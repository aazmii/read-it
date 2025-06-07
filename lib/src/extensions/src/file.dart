part of '../extensions.dart';

extension FileExt on File {
  String? get name => path.getLast('/');
}
