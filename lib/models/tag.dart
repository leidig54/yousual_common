// ignore_for_file: public_member_api_docs, sort_constructors_first
class Tag {
  String name;
  Tag({
    required this.name,
  });

  Tag copyWith({
    String? name,
  }) {
    return Tag(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      name: (map['name'] ?? '') as String,
    );
  }
}
