import 'package:apponertesano/src/blocs/search_api.dart';
import 'package:apponertesano/src/model/caloriesData.dart';
import 'package:apponertesano/src/model/user.dart';
import 'package:apponertesano/src/model/food.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Define un widget de formulario personalizado
class ComidaHistorial extends StatefulWidget {
  const ComidaHistorial({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DisenoState();
}

class _DisenoState extends State<ComidaHistorial> {
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

    dateinput.text = "";
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future init() async {
    final recipes = await RecordApi.getRecipes(datetoday, id_user);
    if (this.mounted) {
      // check whether the state object is in tree
      setState(() => this.recipes = recipes);
    }
  }

  Future init2() async {
    final recipes2 = await RecordCaloriess.getRecipes(datetoday, id_user);
    if (recipes2.length > 0) {
      final calories = recipes2[0].calories;
      if (calories != null) {
        _calories = recipes2[0].calories!;
        _protein = recipes2[0].protein!;
        _fat = recipes2[0].fat!;
        _carbs = recipes2[0].carbs!;
        _sugar = recipes2[0].sugar!;
        _sodium = recipes2[0].sodium!;
      } else {}
    }
    if (this.mounted) {
      // check whether the state object is in tree
      setState(() => this.recipes2 = recipes2);
    }
  }

  @override
  Widget build(BuildContext context) {
    //  args = ModalRoute.of(context).settings.arguments;
    UsuariodataSet data =
        ModalRoute.of(context)!.settings.arguments as UsuariodataSet;
    id_user = data.id_user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de comida por fecha'),
        backgroundColor: Colors.lightGreen.shade600,
        centerTitle: true,
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 22),
        child: Form(
          key: _formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                child: Column(
                  children: [
                    const Text(
                      "• Consulta tus historial resultados •",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                  ],
                ),
              ),
              TextFormField(
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value == "" || value.isEmpty) {
                    return 'Selecciona un dia del calendario';
                  }
                  return null;
                },
                controller: dateinput, //editing controller of this TextField
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  icon: Icon(Icons.calendar_today),
                  //icon of text field
                  labelText:
                      "Selecciona una fecha para ver resultados anteriores:", //label text of field
                ),

                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      dateinput.text = formattedDate;
                      datetoday = formattedDate;
                      init();
                      init2();
                      isVisible = !isVisible;

                      //set output date to TextField value.
                    });
                  } else {
                    print("Fecha no seleccionada");
                  }
                },
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
                                                  _calories.toString() + " cal",
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
                                                          .deepOrange[400],
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
        subtitle: Text(hit.label!),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, "/comidadetail",
              arguments: GetDetailFood(
                hit.label!.toString(),
                hit.image!.toString(),
                hit.type!.toString(),
                hit.quantity!.toDouble(),
                hit.calories!.toDouble(),
                hit.protein!.toDouble(),
                hit.fat!.toDouble(),
                hit.carbs!.toDouble(),
                hit.sugar!.toDouble(),
                hit.sodium!.toDouble(),
              ));
        },
      );
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
