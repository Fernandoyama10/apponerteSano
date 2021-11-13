import 'dart:convert';

class CaloriesdataSet {
  final dynamic calories;
  final dynamic protein;
  final dynamic fat;
  final dynamic carbs;
  final dynamic sugar;

  CaloriesdataSet(
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.sugar,
  );
}

class CaloriesData {
  dynamic calories;
  dynamic protein;
  dynamic fat;
  dynamic carbs;
  dynamic sugar;

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

class RecordCalories {
  dynamic calories;
  dynamic protein;
  dynamic fat;
  dynamic carbs;
  dynamic sugar;
  dynamic sodium;

  RecordCalories({
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.sugar,
    this.sodium,
  });

  factory RecordCalories.fromJson(Map<String, dynamic> json) {
    return RecordCalories(
        calories: json['calories'],
        protein: json['protein'],
        fat: json['fat'],
        carbs: json['carbs'],
        sugar: json['sugar'],
        sodium: json['sodium']);
  }
}

List<RecordCalories> parsePost3(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<RecordCalories>((json) => RecordCalories.fromJson(json))
      .toList();
}
