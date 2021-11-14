
import 'package:apponertesano/src/blocs/search_api.dart';
import 'package:apponertesano/src/model/caloriesData.dart';
import 'package:apponertesano/src/model/user.dart';
import 'package:apponertesano/src/model/food.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

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
 WidgetsBinding.instance!.addPostFrameCallback((_){
            init();
                  init2();
          });
  }

  @override
  void dispose() {
    super.dispose();
  }


 
  @override
  Widget build(BuildContext context) {
    //  args = ModalRoute.of(context).settings.arguments;
    UsuariodataSet data =
        ModalRoute.of(context)!.settings.arguments as UsuariodataSet;
    id_user = data.id_user;
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de comidas del día'),
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
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
            
                        Container(

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
                                                    Text(
                                                      "Tot Cal:",
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
                              ])),
                        ),
                      ])),
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
        
              _showDialog(context, hit.id_meal!);
        },
      );

      
   Future init() async {
    final recipes = await RecordApi.getRecipes(datetoday, id_user);
if (this.mounted) { // check whether the state object is in tree
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

    if (this.mounted) { // check whether the state object is in tree
      setState(() => this.recipes2 = recipes2);
  }
  
  }

  
void _showDialog(BuildContext context, int id_meal) {
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
               
              },
              text: 'Borrar',
              iconData: Icons.delete,
              color: Colors.red,
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]);
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
