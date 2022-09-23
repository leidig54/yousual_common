// ignore_for_file: public_member_api_docs, sort_constructors_first
class NutritionalInfo {
  int? calories;
  int? protein;
  int? carbohydrate;
  int? sugars;
  int? fat;
  int? fibre;
  int? salt;
  NutritionalInfo({
    this.calories,
    this.protein,
    this.carbohydrate,
    this.sugars,
    this.fat,
    this.fibre,
    this.salt,
  });

  NutritionalInfo copyWith({
    int? calories,
    int? protein,
    int? carbohydrate,
    int? sugars,
    int? fat,
    int? fibre,
    int? salt,
  }) {
    return NutritionalInfo(
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbohydrate: carbohydrate ?? this.carbohydrate,
      sugars: sugars ?? this.sugars,
      fat: fat ?? this.fat,
      fibre: fibre ?? this.fibre,
      salt: salt ?? this.salt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'calories': calories,
      'protein': protein,
      'carbohydrate': carbohydrate,
      'sugars': sugars,
      'fat': fat,
      'fibre': fibre,
      'salt': salt,
    };
  }

  factory NutritionalInfo.fromMap(Map<String, dynamic> map) {
    return NutritionalInfo(
      calories: map['calories'] != null ? map['calories'] as int : null,
      protein: map['protein'] != null ? map['protein'] as int : null,
      carbohydrate:
          map['carbohydrate'] != null ? map['carbohydrate'] as int : null,
      sugars: map['sugars'] != null ? map['sugars'] as int : null,
      fat: map['fat'] != null ? map['fat'] as int : null,
      fibre: map['fibre'] != null ? map['fibre'] as int : null,
      salt: map['salt'] != null ? map['salt'] as int : null,
    );
  }
}
