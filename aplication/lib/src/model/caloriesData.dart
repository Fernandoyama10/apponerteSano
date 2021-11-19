import 'dart:convert';

class CaloriesdataSet {
  final dynamic calories;
  final dynamic protein;
  final dynamic fat;
  final dynamic carbs;
  final dynamic sugar;
  final dynamic sodium;

  CaloriesdataSet(
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.sugar,
    this.sodium,
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
  dynamic initial_calories;
  dynamic id_status;
  dynamic name_status;

  RecordCalories(
      {this.calories,
      this.protein,
      this.fat,
      this.carbs,
      this.sugar,
      this.sodium,
      this.initial_calories,
      this.id_status,
      this.name_status});

  factory RecordCalories.fromJson(Map<String, dynamic> json) {
    return RecordCalories(
        calories: json['calories'],
        protein: json['protein'],
        fat: json['fat'],
        carbs: json['carbs'],
        sugar: json['sugar'],
        sodium: json['sodium'],
        initial_calories: json['initial_calories'],
        id_status: json['id_status'],
        name_status: json['name_status']);
  }
}

List<RecordCalories> parsePost3(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<RecordCalories>((json) => RecordCalories.fromJson(json))
      .toList();
}


