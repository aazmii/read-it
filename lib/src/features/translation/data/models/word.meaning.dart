import 'dart:convert';

class Translation {
  final String en;
  final String bn;
  Translation({
    required this.en,
    required this.bn,
  });

  Translation copyWith({
    String? en,
    String? bn,
  }) {
    return Translation(
      en: en ?? this.en,
      bn: bn ?? this.bn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'en': en,
      'bn': bn,
    };
  }

  factory Translation.fromMap(Map<String, dynamic> map) {
    return Translation(
      en: map['en'] as String,
      bn: map['bn'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Translation.fromJson(String source) => Translation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Translation(en: $en, bn: $bn)';

  @override
  bool operator ==(covariant Translation other) {
    if (identical(this, other)) return true;

    return other.en == en && other.bn == bn;
  }

  @override
  int get hashCode => en.hashCode ^ bn.hashCode;
}
