import 'package:isar/isar.dart';

part 'opened.file.detail.g.dart';

@Collection()
class RecentFile {
  Id id = Isar.autoIncrement;
  String? path;
  String? converPath;
  DateTime? lastOpen;
  List<byte>? fileData;
  bool? isLastOpened;

  RecentFile({
    this.path,
    this.lastOpen,
    this.fileData,
    this.isLastOpened,
  });
}
