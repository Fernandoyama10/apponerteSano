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

  Recipe({this.label, this.image});

  Recipe.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['image'] = this.image;
    return data;
  }
}



class GetRecipe {
  final String label;
  final String image;
  GetRecipe(this.label, this.image);
}
