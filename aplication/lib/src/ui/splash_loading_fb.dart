import 'dart:async';
import 'package:apponertesano/src/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_dialogs/material_dialogs.dart';
class SplashLoadingFB extends StatefulWidget {
  @override
  _SplashLoadingState createState() => _SplashLoadingState();
}

class _SplashLoadingState extends State<SplashLoadingFB> {
    String remail = "";
    String name = "";
    String id= "";
  @override
  void initState() {

 super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future<List<Usuario>> listapost = verifyLogin(context, remail);
    });


   
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
         late UserDat model = ModalRoute.of(context)!.settings.arguments as UserDat;
    remail = model.email;
    name = model.name;
    id = model.id;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.white,
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
             Lottie.asset(
          'images/86630-fb-logo.json',
          height: 320,
          width: 250,
        ),
          SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            width: 300,
            child: Text(
              "Cargando...",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue.shade800,
                  decoration: TextDecoration.none),
            ),
          ),
          SizedBox(height: 30),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
  

  Future<List<Usuario>> verifyLogin(BuildContext context, String email) async {
    final url = Uri.parse(
        'http://apiapponertesano.azurewebsites.net/api/logindata/$email');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<Usuario> lista = parsePost(response.body);
      if (lista.length > 0) {
        print(lista[0].password);
        Navigator.pushReplacementNamed(context, "/inicio",
            arguments: UsuariodataSet(
                lista[0].id_user!,
                lista[0].email!,
                lista[0].password!,
                lista[0].id_role!,
                lista[0].name!,
                lista[0].surname!,
                lista[0].age!,
                lista[0].weight!,
                lista[0].gender!,
                lista[0].height!,
                lista[0].name_level!,
                lista[0].value_level!,
                lista[0].fb_complete!));
      } else {
         Timer(Duration(seconds: 2),
        () =>   Navigator.of(context).pushReplacementNamed('/registrarfb',
            arguments: UserDat(
              remail,
              name,
              id,
            )));
       
      }
      return lista;
    } else {
      _showDialog(context, 'No existe conexión');
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  void _showDialog(BuildContext context, String texto1) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Mensaje"),
          content: new Text(texto1),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
