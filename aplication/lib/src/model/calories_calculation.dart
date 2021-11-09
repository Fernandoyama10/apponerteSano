import 'dart:html';

import 'package:apponertesano/src/model/user.dart';
import 'package:apponertesano/src/resources/userData.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';

class Calories_calculation {
 /**  void _getuserdata() {
     UserLogin data;
    Future<List<UsuarioData>> listapost =
        getdata(context, data.id_user.toString());
  }

  Future<List<UsuarioData>> getdata(
      BuildContext context, String id_user) async {
    final url = Uri.parse(
        'http://apiapponertesano.azurewebsites.net/api//getUserData/$id_user');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<UsuarioData> lista1 = parsePostdata(response.body);
      if (lista1.length > 0) {
          
           return lista1.map((json) => UsuarioData.fromJson(json)).toList();
        
      } else {
        print('No existe el usuario en la aplicación');
      }
      return lista1;
    } else {
      print('No existe conexión');
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  */
}

