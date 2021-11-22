import 'dart:convert';

import 'package:apponertesano/src/blocs/search_api.dart';
import 'package:apponertesano/src/model/caloriesData.dart';
import 'package:apponertesano/src/model/user.dart';
import 'package:apponertesano/src/model/food.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:http/http.dart' as http;

// Define un widget de formulario personalizado
class ComidaDia extends StatefulWidget {
  const ComidaDia({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DisenoState();
}

class _DisenoState extends State<ComidaDia> {
  final _formKey1 = GlobalKey<FormState>();
  String datetoday = DateFormat("yyyy-MM-dd").format(DateTime.now());
  TextEditingController dateinput = TextEditingController();
  int id_user = 0;
  dynamic _calories = 0;
  dynamic _protein = 0;
  dynamic _fat = 0;
  dynamic _carbs = 0;
  dynamic _sugar = 0;
  dynamic _sodium = 0;
  dynamic _initialcalories = 0;
  dynamic _diferencia = 0;
  dynamic _statusname = "";
  dynamic _idstatus = 0;
  List<FoodRecord> recipes = [];
  List<RecordCalories> recipes2 = [];
  // static datosArguments args;
// log aout
  //clase choice
  /*  void _select(Choice choice){
setState(() {
  switch (choice.title) {
    case 'LOG OUT':
        Navigator.pushNamed(context, '/login');
        break;
  }
});
}*/
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      init();
      init2();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _refresh() {
    init();
    init2();
    return Future.delayed(Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    //  args = ModalRoute.of(context).settings.arguments;
    UsuariodataSet data =
        ModalRoute.of(context)!.settings.arguments as UsuariodataSet;
    id_user = data.id_user;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Registro de comidas del día'),
        backgroundColor: Colors.lightGreen.shade600,
        centerTitle: true,
      ),

      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Form(
          key: _formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              const Text(
                "• Gestionar comidas de hoy •",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Ver / Ocultar : Totales del dia'),
                          onPressed: () {
                            if (_formKey1.currentState!.validate()) {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Visibility(
                          visible: isVisible,
                          maintainSize: false,
                          maintainAnimation: true,
                          maintainState: true,
                          child: Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              color: Colors.amber[50],
                                              elevation: 5,
                                              child: ListTile(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: RichText(
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        strutStyle: StrutStyle(
                                                            fontSize: 15.0),
                                                        text: TextSpan(
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 13.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            text:
                                                                "Calorias sumadas:"),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                                subtitle: Text(
                                                  _calories.toStringAsFixed(0) +
                                                      " cal",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors
                                                          .deepOrange[400],
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(0.2),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              color: Colors.amber[50],
                                              elevation: 5,
                                              child: ListTile(
                                                  title: Text(
                                                    "Calorias Iniciales:",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color:
                                                            Colors.green[700],
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                  subtitle: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        _initialcalories
                                                                .toStringAsFixed(
                                                                    0) +
                                                            " cal",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                            color: Colors
                                                                    .deepOrange[
                                                                400],
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                      SizedBox(width: 10),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              color: Colors.amber[50],
                                              elevation: 5,
                                              child: ListTile(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Diferencia:",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color:
                                                              Colors.green[700],
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                                subtitle: Text(
                                                  _diferencia
                                                          .toStringAsFixed(0) +
                                                      " cal",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors
                                                          .deepOrange[400],
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(0.2),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              color: Colors.amber[50],
                                              elevation: 5,
                                              child: ListTile(
                                                  title: Text(
                                                    '$_statusname',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13.5,
                                                        color:
                                                            Colors.green[400],
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                  subtitle: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        " estado",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                            color: Colors
                                                                    .deepOrange[
                                                                300],
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                      SizedBox(width: 10),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              color: Colors.amber[50],
                                              elevation: 5,
                                              child: ListTile(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Total Prote:",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors
                                                              .deepOrange[300],
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                                subtitle: Text(
                                                  _protein.toString() + " gr",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors
                                                          .deepOrange[400],
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              color: Colors.amber[50],
                                              elevation: 5,
                                              child: ListTile(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Total Grasa:",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors
                                                              .deepOrange[300],
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                                subtitle: Text(
                                                  _fat.toString() + " gr",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors
                                                          .deepOrange[400],
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              color: Colors.amber[50],
                                              elevation: 5,
                                              child: ListTile(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Total Sodio:",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors
                                                              .deepOrange[300],
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                                subtitle: Text(
                                                  _sodium.toString() + " mg",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors
                                                          .deepOrange[400],
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              color: Colors.amber[50],
                                              elevation: 5,
                                              child: ListTile(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Total Carbs:",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors
                                                              .deepOrange[300],
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                                subtitle: Text(
                                                  _carbs.toString() + " gr",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors
                                                          .deepOrange[400],
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(0.2),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              color: Colors.amber[50],
                                              elevation: 5,
                                              child: ListTile(
                                                  title: Text(
                                                    "Total Azucar:",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13.5,
                                                        color: Colors
                                                            .deepOrange[400],
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                  subtitle: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        _sugar.toString() +
                                                            " gr",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                            color: Colors
                                                                    .deepOrange[
                                                                300],
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                      SizedBox(width: 10),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              color: Colors.amber[50],
                                              elevation: 5,
                                              child: ListTile(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "-",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors
                                                              .deepOrange[300],
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                                subtitle: Text(
                                                  "-",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors
                                                          .deepOrange[400],
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ])),
                        ),
                      ])),
              SizedBox(
                height: 8,
              ),
              const Text(
                "Lista de Comidas:",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final book = recipes[index];

                  return buildBook(book);
                },
              ))
            ],
          ),
        ),
      ),
      // color: Colors.green[600],
    );
  }

  Widget buildBook(FoodRecord hit) => ListTile(
        leading: Image.network(
          hit.image!,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(hit.label!),
        subtitle: Text('Registro #' + (hit.id_meal!).toString()),
        trailing: Icon(Icons.delete),
        onTap: () {
          _showDialog(
              context, hit.id_meal!, hit.calories!, hit.id_user!, hit.date_r!);
        },
      );

  Future init() async {
    final recipes = await RecordApi.getRecipes(datetoday, id_user);
    if (this.mounted) {
      // check whether the state object is in tree
      setState(() => this.recipes = recipes);
    }
  }

  Future borrarcomida(int id_meal) async {
    final recipes = await DeleteFoodApi.getRecipes(id_meal);
  }

  Future init2() async {
    final recipes2 = await RecordCaloriesStatus.getRecipes(datetoday, id_user);
    if (recipes2.length > 0) {
      final calories = recipes2[0].calories;
      if (calories != null) {
        _calories = recipes2[0].calories!;
        _protein = recipes2[0].protein!;
        _fat = recipes2[0].fat!;
        _carbs = recipes2[0].carbs!;
        _sugar = recipes2[0].sugar!;
        _sodium = recipes2[0].sodium!;
        _initialcalories = recipes2[0].initial_calories!;
        _diferencia = _initialcalories - _calories;
        _idstatus = recipes2[0].id_status!;
        _statusname = recipes2[0].name_status!;
      } else {
        _calories = 0;
        _protein = 0;
        _fat = 0;
        _carbs = 0;
        _sugar = 0;
        _sodium = 0;
        _initialcalories = 0;
        _diferencia = 0;
        _idstatus = 0;
        _statusname = "No haz registrado";
      }
    }

    if (this.mounted) {
      // check whether the state object is in tree
      setState(() => this.recipes2 = recipes2);
    }
  }

  void _showDialog(BuildContext context, int id_meal, dynamic calories,
      int id_user, String date) {
    Dialogs.bottomMaterialDialog(
        msg: '¿Esta seguro que quiere borrar este registro?',
        title: 'Eliminar el registro ' + id_meal.toString(),
        context: context,
        actions: [
          IconsOutlineButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Cancelar',
            iconData: Icons.cancel_outlined,
            textStyle: TextStyle(color: Colors.grey),
            iconColor: Colors.grey,
          ),
          IconsButton(
            onPressed: () {
              Navigator.pop(context);

              borrarcomida(id_meal);
              deletecalories(
                context,
                calories,
                id_user,
                date,
              );
            },
            text: 'Borrar',
            iconData: Icons.delete,
            color: Colors.red,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }

  void _mensajeSuccess(BuildContext context) {
    Dialogs.materialDialog(
        color: Colors.white,
        msg: 'Esta comida fue eliminada de tu historial de hoy',
        title: 'Perfecto!',
        lottieBuilder: Lottie.asset(
          'images/62669-success-lottie-animation.json',
          height: 25,
          width: 25,
        ),
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Aceptar',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }

  Future deletecalories(
    BuildContext context,
    dynamic calories,
    int id_user,
    String date,
  ) async {
    Map data = {
      'calories': calories,
      'id_user': id_user,
      'date': date,
    };
    var body = json.encode(data);

    final response = await http.post(
        Uri.parse(
            "https://apiapponertesano.azurewebsites.net/apiyucfood/deletecalories"),
        headers: {"Content-Type": "application/json"},
        body: body);

    final value = json.decode(response.body)["statusCode"];

    if (response.statusCode == 200) {
      if (value == 400) {
        _showDialog2(context, 'Error 404, contacta administrador');
      } else {
        init();
        init2();
        _mensajeSuccess(context);
      }
    } else {
      throw Exception('No se Agrego, intenta nuevamente');
    }
  }

  void _showDialog2(BuildContext context, String texto1) {
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

/* 
class Choice{
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List <Choice> choices = const <Choice>[
  const Choice(title: 'LOG OUT', icon: Icons.power_settings_new),


];*/
