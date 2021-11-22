import 'dart:convert';
import 'package:apponertesano/src/model/food.dart';
import 'package:apponertesano/src/model/caloriesData.dart';
import 'package:apponertesano/src/model/user.dart';
import 'package:http/http.dart' as http;

class EdamamApi {
  static Future<List<Hits>> getRecipes(String query) async {
    final url = Uri.parse(
        'https://api.edamam.com/api/recipes/v2?type=public&q=$query&app_id=a1eaefc0&app_key=3eaa4ac320b7f80c5c7f6bdd2ca47ced');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final parse = jsonDecode(body);
      final finaldata = parse["hits"];
      final List hits = finaldata;

      return hits.map((json) => Hits.fromJson(json)).where((hits) {
        final labelLower = hits.recipe!.label!.toLowerCase();
        final imageLower = hits.recipe!.image!.toLowerCase();
        final searchLower = query.toLowerCase();

        return labelLower.contains(searchLower) ||
            imageLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}


class LocalApi {
  static Future<List<RecipeYucatan>> getRecipes(String query) async {
    final url = Uri.parse(
        'https://apiapponertesano.azurewebsites.net/apiyucfood/get-yucfood/$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = response.body;
      final parse = jsonDecode(body);
      final List recipeYucatan = parse;

      return recipeYucatan.map((json) => RecipeYucatan.fromJson(json)).where((recipe) {
        final labelLower = recipe.food_name!.toLowerCase();
        final imageLower = recipe.food_name!.toLowerCase();
        final searchLower = query.toLowerCase();

        return labelLower.contains(searchLower) ||
            imageLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}

class RecordApi {
  static Future<List<FoodRecord>> getRecipes(String date_r, int id_user) async {
    final url = Uri.parse(
        'https://apiapponertesano.azurewebsites.net/apiyucfood/get-records/$date_r/$id_user');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = response.body;
      final parse = jsonDecode(body);
      final List recipeYucatan = parse;
      return recipeYucatan.map((json) => FoodRecord.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}


class RecordCaloriess {
  static Future<List<RecordCalories>> getRecipes(String date_r, int id_user) async {
    final url = Uri.parse(
        'https://apiapponertesano.azurewebsites.net/apiyucfood/get-recordcalories/$date_r/$id_user');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = response.body;
      final parse = jsonDecode(body);
    
      final List recipeYucatan = parse;

        return recipeYucatan.map((json) => RecordCalories.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}


class RecordCaloriesInicio {
  static Future<List<RecordCalories>> getRecipes(String date_r, int id_user) async {
    final url = Uri.parse(
        'http://apiapponertesano.azurewebsites.net/apicalories/calories/$date_r/$id_user');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = response.body;
      final parse = jsonDecode(body);

      final List recipeYucatan = parse;

        return recipeYucatan.map((json) => RecordCalories.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}

class RecordCaloriesStatus {
  static Future<List<RecordCalories>> getRecipes(
    
    String date_r, 
    int id_user
    ) async {
       Map data = {
      'date_r': date_r,
      'id_user': id_user
    };
        var body = json.encode(data);

    final response = await http.post(
        Uri.parse(
            "http://apiapponertesano.azurewebsites.net/apicalories/calories"),
        headers: {"Content-Type": "application/json"},
        body: body);


    if (response.statusCode == 200) {
      String body = response.body;
      final parse = jsonDecode(body);
    
      final List recipeYucatan = parse;

        return recipeYucatan.map((json) => RecordCalories.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}

class InfoUser {
  static Future<List<InfoDatauser>> getRecipes(int id_user) async {
    final url = Uri.parse(
        'http://apiapponertesano.azurewebsites.net/api/get-infouser/$id_user');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = response.body;
      final parse = jsonDecode(body);
    
      final List recipeYucatan = parse;

        return recipeYucatan.map((json) => InfoDatauser.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}




class DeleteFoodApi {
  static Future getRecipes(int id_meal) async {
    final url = Uri.parse(
        'https://apiapponertesano.azurewebsites.net/apiyucfood/deletefood/$id_meal');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      String body = response.body;
      final parse = jsonDecode(body);
      return parse;
    } else {
      throw Exception();
    }
  }
}