import 'dart:convert';

class Hits {
  Recipe? recipe;

  Hits(String string, {this.recipe});

  Hits.fromJson(Map<String, dynamic> json) {
    recipe =
        json['recipe'] != null ? new Recipe.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipe != null) {
      data['recipe'] = this.recipe?.toJson();
    }
    return data;
  }
}

class Recipe {
  String? label;
  String? image;
  double? yield;
  double? calories;
  TotalNutrients? totalNutrients;

  Recipe(
      {this.label, this.image, this.yield, this.calories, this.totalNutrients});

  Recipe.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    image = json['image'];
    yield = json['yield'];
    calories = json['calories'];
    totalNutrients = json['totalNutrients'] != null
        ? new TotalNutrients.fromJson(json['totalNutrients'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['image'] = this.image;
    data['yield'] = this.yield;
    data['calories'] = this.calories;
    return data;
  }
}

class TotalNutrients {
  FAT? fat;
  SUGAR? sugar;
  PROCNT? procnt;
  NA? na;
  CHOCDF? chocdf;

  TotalNutrients({this.fat, this.sugar, this.procnt, this.na, this.chocdf});

  TotalNutrients.fromJson(Map<String, dynamic> json) {
    fat = json['FAT'] != null ? new FAT.fromJson(json['FAT']) : null;
    sugar = json['SUGAR'] != null ? new SUGAR.fromJson(json['SUGAR']) : null;
    procnt =
        json['PROCNT'] != null ? new PROCNT.fromJson(json['PROCNT']) : null;
    na = json['NA'] != null ? new NA.fromJson(json['NA']) : null;
    chocdf =
        json['CHOCDF'] != null ? new CHOCDF.fromJson(json['CHOCDF']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fat != null) {
      data['FAT'] = this.fat?.toJson();
    }
    if (this.sugar != null) {
      data['SUGAR'] = this.sugar?.toJson();
    }
    if (this.procnt != null) {
      data['PROCNT'] = this.procnt?.toJson();
    }
    if (this.na != null) {
      data['NA'] = this.na?.toJson();
    }
    if (this.chocdf != null) {
      data['CHOCDF'] = this.chocdf?.toJson();
    }
    return data;
  }
}

class FAT {
  double? quantity;

  FAT({this.quantity});

  FAT.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    return data;
  }
}

class SUGAR {
  double? quantity;

  SUGAR({this.quantity});

  SUGAR.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    return data;
  }
}

class PROCNT {
  double? quantity;

  PROCNT({this.quantity});

  PROCNT.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    return data;
  }
}

class NA {
  double? quantity;

  NA({this.quantity});

  NA.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    return data;
  }
}

class CHOCDF {
  double? quantity;

  CHOCDF({this.quantity});

  CHOCDF.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    return data;
  }
}

class GetRecipe {
  final String label;
  final String image;
  final double yield;
  final double calories;
  final double quantitysugar;
  final double quantityna;
  final double quantitychocdf;
  final double quantityfat;
  final int id_user;
  late final double quantityprocnt;
  GetRecipe(this.label, this.image, this.yield, this.calories,
      this.quantitysugar, this.quantityna, this.quantitychocdf, this.quantityfat,this.id_user,this.quantityprocnt);
}
