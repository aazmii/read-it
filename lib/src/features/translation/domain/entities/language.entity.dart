class LanguageEntity {
  final String code;
  final String name;
  final bool isDownloaded;

  LanguageEntity({required this.code, required this.name, required this.isDownloaded});
  LanguageEntity copyWith({bool? isDownloaded}) => LanguageEntity(
        code: code,
        name: name,
        isDownloaded: isDownloaded ?? this.isDownloaded,
      );
}
