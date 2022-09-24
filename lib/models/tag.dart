// ignore_for_file: public_member_api_docs, sort_constructors_first
class Tag {
  String tagId;
  String tagName;
  Tag({
    required this.tagId,
    required this.tagName,
  });

  Tag copyWith({
    String? tagId,
    String? tagName,
  }) {
    return Tag(
      tagId: tagId ?? this.tagId,
      tagName: tagName ?? this.tagName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tagId': tagId,
      'tagName': tagName,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      tagId: (map['tagId'] ?? '') as String,
      tagName: (map['tagName'] ?? '') as String,
    );
  }
}
