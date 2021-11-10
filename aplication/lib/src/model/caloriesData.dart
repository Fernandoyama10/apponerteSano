import 'dart:convert';

class CaloriesdataSet {
  final double calories;
  final double protein;
  final double fat;
  final double carbs;
  final double sugar;

  CaloriesdataSet(
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.sugar,
  );
}

class CaloriesData {
  double? calories;
  double? protein;
  double? fat;
  double? carbs;
  double? sugar;

  CaloriesData({
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.sugar,
  });

  factory CaloriesData.fromJson(Map<String, dynamic> json) {
    return CaloriesData(
        calories: json['calories'],
        protein: json['protein'],
        fat: json['fat'],
        carbs: json['carbs'],
        sugar: json['sugar']);
  }
}

List<CaloriesData> parsePost2(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<CaloriesData>((json) => CaloriesData.fromJson(json))
      .toList();
}
