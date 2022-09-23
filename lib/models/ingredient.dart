// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ingredient {
  String name;
  Ingredient({
    required this.name,
  });

  Ingredient copyWith({
    String? name,
  }) {
    return Ingredient(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      name: (map['name'] ?? '') as String,
    );
  }
}
