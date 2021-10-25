import 'dart:convert';
import 'package:aplication/src/model/food.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

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
