import 'package:apponertesano/src/blocs/search_api.dart';
import 'package:apponertesano/src/model/caloriesData.dart';
import 'package:apponertesano/src/model/user.dart';
import 'package:apponertesano/src/resources/facebook_login_result.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Define un widget de formulario personalizado
class Diseno extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DisenoState();
}

class _DisenoState extends State<Diseno> {
  // UsuariodataSet? data3;
// log aout
  //clase choice
  int _id_user = 0;
  dynamic _height = 0;
  dynamic _weight = 0;
  int _age = 0;
  double _activity = 0;
  String _gender = "";
  int _resultCalories = 0;
  double _mtb = 0;
  int _lowcalories = 0;
  String _datetoday = DateFormat("yyyy-MM-dd").format(DateTime.now());
  dynamic _calories = 0;
  dynamic _calories1 = 0;
  dynamic _protein = 0;
  dynamic _protein1 = 0;
  dynamic _fat = 0;
  dynamic _fat1 = 0;
  dynamic _carbs = 0;
  dynamic _carbs1 = 0;
  dynamic _sugar = 0;
  dynamic _sugar1 = 0;
    dynamic _sodium = 0;
  dynamic _sodium1 = 0;
  dynamic _operationcalories1 = 0;
  List<RecordCalories> recipes2 = [];
  @override
  void initState() {
    super.initState();
 WidgetsBinding.instance!.addPostFrameCallback((_){
   init2();
          });
  }

  @override
  void dispose() {
    super.dispose();
  }


  int calculateCalories(height, weight, age, activity, gender) {
    if (gender == "Masculino") {
      _mtb = ((66 + (13.7 * weight)) + ((5 * height) - (6.8 * age)));
      _resultCalories = (_mtb * activity).round();
      _lowcalories = _resultCalories - 500;
      print('==========operación resta========');
      _operationcalories1 = _resultCalories - _calories;
      print(_operationcalories1);
      print(_resultCalories);
    } else {
      _mtb = ((655 + (9.6 * weight)) + ((1.8 * height) - (4.7 * age)));
      _resultCalories = (_mtb * activity).round();
      _lowcalories = _resultCalories - 500;
    }
    return _resultCalories;
  }

  Future init2() async {
    final recipes2 = await RecordCaloriesInicio.getRecipes(_datetoday, _id_user);
    if (recipes2.length > 0) {
      final calories = recipes2[0].calories;
      if (calories != null) {
        _calories = recipes2[0].calories!;
        _protein = recipes2[0].protein!;
        _fat = recipes2[0].fat!;
        _carbs = recipes2[0].carbs!;
        _sugar = recipes2[0].sugar!;
        _sodium = recipes2[0].sodium!;
       
      } else {
          CaloriesdataSet(0, 0, 0, 0, 0, 0);
      }
    }
    if (this.mounted) { // check whether the state object is in tree
setState(() => this.recipes2 = recipes2);
  }
    
  }



  void _cambiovalue() {
    setState(() {
      _calories = _calories1;
      _protein = _protein1;
      _fat = _fat1;
      _carbs = _carbs1;
      _sugar = _sugar1;
    });
  }
  Future<void> _refresh(){
     init2();
    return Future.delayed(Duration(seconds: 0));
  }
  @override
  Widget build(BuildContext context) {
    UsuariodataSet data =
        ModalRoute.of(context)!.settings.arguments as UsuariodataSet;

    _height = data.height;
    _weight = data.weight;
    _age = data.age;
    _activity = data.value_level;
    _gender = data.gender;
    _id_user = data.id_user;
   
    calculateCalories(_height, _weight, _age, _activity, _gender);

    return Scaffold(

      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Container(
  height: MediaQuery.of(context).size.height,
      width: double.infinity,

      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [
              Colors.lightGreen.shade600,
              Colors.lightGreen.shade400,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),

      // color: Colors.green[600],
      child: Stack(
        children: <Widget>[
          //Container for top data
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 52),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '$_calories',
                      style: TextStyle(
                          color: Colors.yellow[400],
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          OutlineButton(
                              disabledBorderColor: Colors.cyan,
                              borderSide: BorderSide(
                                  color: Colors.black38,
                                  style: BorderStyle.solid,
                                  width: 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(75)),
                              onPressed: () {
                                   Navigator.pushNamed(context, "/historialcomida",
                                      arguments: UsuariodataSet(
                                          data.id_user,
                                          data.email,
                                          data.password,
                                          data.id_role,
                                          data.name,
                                          data.surname,
                                          data.age,
                                          data.weight,
                                          data.gender,
                                          data.height,
                                          data.name_level,
                                          data.value_level));
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.green[200],
                                radius: 22.0,
                                child: Image.network(
                                    "https://cdn-icons-png.flaticon.com/512/147/147144.png"
                                    // child: Image.network('https://firebasestorage.googleapis.com/v0/b/rewardcan.appspot.com/o/'+args.id_usu.toString()+'.jpg?alt=media&token=2726aacf-0aa2-4c25-aaf5-f9641ee94114', width: 50.0, height: 45, fit: BoxFit.fill
                                    ),
                              )),
                          SizedBox(
                            width: 7,
                          ),
                          FloatingActionButton.extended(
                            onPressed: () {
                              Provider.of<FacebookSignInController>(context,
                                      listen: false)
                                  .logOut();
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            backgroundColor: Colors.white,
                            icon: Icon(
                              Icons.power_settings_new,
                              color: Colors.red[400],
                            ),
                            label: Text(
                              "Exit",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  "Calorias consumidas",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
          

                SizedBox(
                  height: 15,
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
                                borderRadius: BorderRadius.circular(18),
                              ),
                              color: Colors.amber[50],
                              elevation: 5,
                              child: ListTile(
                                  title: Text(
                                    _resultCalories.toString() + " cal",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.deepOrange[400],
                                        decoration: TextDecoration.none),
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "tu calculo",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.deepOrange[300],
                                            decoration: TextDecoration.none),
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
                            padding: const EdgeInsets.all(0.2),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              color: Colors.amber[50],
                              elevation: 5,
                              child: ListTile(
                                  title: Text(
                                    '$_operationcalories1' + " cal",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.deepOrange[400],
                                        decoration: TextDecoration.none),
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "restantes",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.deepOrange[300],
                                            decoration: TextDecoration.none),
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
                            padding: const EdgeInsets.all(0.2),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              color: Colors.amber[50],
                              elevation: 5,
                              child: ListTile(
                                  title: Text(
                                    "Excelente trabajo!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.5,
                                        color: Colors.green[400],
                                        decoration: TextDecoration.none),
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        " estado",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.deepOrange[300],
                                            decoration: TextDecoration.none),
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
                )
              ],
            ),
          ),

          //draggable sheet
          DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 245, 248, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 24,
                      ),

                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                minWidth: 200.0,
                                height: 70.0,
                                onPressed: () {
                                  Navigator.pushNamed(context, "/tipocomida",
                                      arguments: UsuariodataSet(
                                          data.id_user,
                                          data.email,
                                          data.password,
                                          data.id_role,
                                          data.name,
                                          data.surname,
                                          data.age,
                                          data.weight,
                                          data.gender,
                                          data.height,
                                          data.name_level,
                                          data.value_level));
                                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Consumolista(listapost: fetchPost1(args.clave.toString()),p: args.puntos,usu: args.id_usu,id_sa: args.id_salon)));
                                },
                                color: Colors.green[400],
                                child: Text('Registrar mi Comida',
                                    style: TextStyle(
                                        color: Colors.yellow[200],
                                        fontSize: 16)),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Bienvenido: ' + data.name + " " + data.surname,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.brown,
                                    decoration: TextDecoration.none),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              "¿Cómo voy en mi alimentación de hoy?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                      ),

                      SizedBox(
                        height: 24,
                      ),

                      //Container for buttons
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Row(
                          children: const <Widget>[],
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      //Container Listview for expenses and incomes
                      Container(
                        child: Text(
                          "Calorias",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                              decoration: TextDecoration.none),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 32),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                  child: ImageIcon(
                                    AssetImage("images/applogo.png"),
                                    color: Colors.green,
                                  ),
                                  padding: EdgeInsets.all(12),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "llevas consumido " +
                                            '$_calories' +
                                            "g cal. hoy",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.green[900],
                                            decoration: TextDecoration.none),
                                      ),
                                      Text(
                                        "te quedan 1500 cal. restantes según tu calculo calorico para mantener tu peso",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[500],
                                            decoration: TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 1,
                        padding: EdgeInsets.all(0),
                        controller: ScrollController(keepScrollOffset: false),
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 32),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                  child: ImageIcon(
                                    AssetImage("images/applogo.png"),
                                    color: Colors.green,
                                  ),
                                  padding: EdgeInsets.all(12),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Calorias para bajar de peso necesitas " +
                                            _lowcalories.toString() +
                                            " cal.",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.green[900],
                                            decoration: TextDecoration.none),
                                      ),
                                      Text(
                                        "para bajar de peso lo recomendable por día en base a tus calorias inciales",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[500],
                                            decoration: TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 1,
                        padding: EdgeInsets.all(0),
                        controller: ScrollController(keepScrollOffset: false),
                      ),

                      //now expense
                      SizedBox(
                        height: 16,
                      ),

                      Container(
                        child: Text(
                          "Grasas",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                              decoration: TextDecoration.none),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 32),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                  child: ImageIcon(
                                    AssetImage("images/icon/applogo.png"),
                                    color: Colors.green,
                                  ),
                                  padding: EdgeInsets.all(12),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "llevas " +
                                            '$_fat' +
                                            "g de grasas totales",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.green[900],
                                            decoration: TextDecoration.none),
                                      ),
                                      Text(
                                        "Totales de grasas registradas al día de hoy",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[500],
                                            decoration: TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 1,
                        padding: EdgeInsets.all(0),
                        controller: ScrollController(keepScrollOffset: false),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      Container(
                        child: Text(
                          "Proteina",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                              decoration: TextDecoration.none),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 32),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                  child: ImageIcon(
                                    AssetImage("images/icon/applogo.png"),
                                    color: Colors.green,
                                  ),
                                  padding: EdgeInsets.all(12),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "llevas " +
                                            '$_protein' +
                                            "g de proteina ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.green[900],
                                            decoration: TextDecoration.none),
                                      ),
                                      Text(
                                        "Proteina registrada del día de hoy",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[500],
                                            decoration: TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 1,
                        padding: EdgeInsets.all(0),
                        controller: ScrollController(keepScrollOffset: false),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      Container(
                        child: Text(
                          "Carbohidratos",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                              decoration: TextDecoration.none),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 32),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                  child: ImageIcon(
                                    AssetImage("images/applogo.png"),
                                    color: Colors.green,
                                  ),
                                  padding: EdgeInsets.all(12),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Llevas" + '$_carbs' + "g de carb.",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.green[900],
                                            decoration: TextDecoration.none),
                                      ),
                                      Text(
                                        "Carbohidratos registrado del día de hoy",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[500],
                                            decoration: TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 1,
                        padding: EdgeInsets.all(0),
                        controller: ScrollController(keepScrollOffset: false),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        child: Text(
                          "Azucares",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                              decoration: TextDecoration.none),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 32),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                  child: ImageIcon(
                                    AssetImage("images/applogo.png"),
                                    color: Colors.green,
                                  ),
                                  padding: EdgeInsets.all(12),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Llevas " +
                                            '$_sugar' +
                                            "g de azucares.",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.green[900],
                                            decoration: TextDecoration.none),
                                      ),
                                      Text(
                                        "Azucares registrado del día de hoy",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[500],
                                            decoration: TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 1,
                        padding: EdgeInsets.all(0),
                        controller: ScrollController(keepScrollOffset: false),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      //now expense
                    ],
                  ),
                  controller: scrollController,
                ),
              );
            },
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 1,
          )
        ],
      ),
        ),
      ),
        
    
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
