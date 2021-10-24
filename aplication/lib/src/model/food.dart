
/*
class RecipeList {
  Recipe? recipe;

  RecipeList({this.recipe});

  RecipeList.fromJson(Map<String, dynamic> json) {
    recipe = json['recipe'] != null ? new Recipe.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipe != null) {
      data['fat'] = this.recipe?.toJson();
    }
    return data;
  }
}


class Recipe {
  String? label;
  String? image;
  int? yield;
  String? calories;
  TotalNutrients? totalNutrients;


  Recipe(data, 
      {this.label,
      this.image,
      this.yield,
      this.calories,
      this.totalNutrients
});

  Recipe.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    image = json['image'];
    yield = json['yield'];
    calories = json['calories'];
    totalNutrients =
        json['totalNutrients'] != null ? new TotalNutrients.fromJson(json['totalNutrients']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['image'] = this.image;
    data['yield'] = this.yield;
    data['calories'] = this.calories;
    if (this.totalNutrients != null) {
      data['totalNutrients'] = this.totalNutrients?.toJson();
    }
    return data;
  }

  toLowerCase() {}
}

class TotalNutrients {
  Fat? fat;

  TotalNutrients({this.fat});

  TotalNutrients.fromJson(Map<String, dynamic> json) {
    fat = json['fat'] != null ? new Fat.fromJson(json['fat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fat != null) {
      data['fat'] = this.fat?.toJson();
    }
    return data;
  }
}

class Fat {
  String? quantity;

  Fat({this.quantity});

  Fat.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    return data;
  }
}
*/
