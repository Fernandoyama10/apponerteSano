import 'package:apponertesano/src/blocs/search_api.dart';
import 'package:apponertesano/src/model/caloriesData.dart';
import 'package:apponertesano/src/model/user.dart';
import 'package:apponertesano/src/resources/facebook_login_result.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
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
  dynamic _statusname = "";
  dynamic _idstatus = 0;
  dynamic _operationcalories1 = 0;
  String _text_operation = "";
  dynamic _operation_calories_final = 0;
  List<RecordCalories> recipes2 = [];

  Color _changecolor = Colors.grey;
  Color _changecolor2 = Colors.yellow.shade400;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
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
      _operationcalories1 = _resultCalories - _calories;
      if (_operationcalories1 < 0) {
        _operation_calories_final = (_operationcalories1.abs()).round();
        _text_operation = "*Pasadas";
      } else {
        _operation_calories_final = _operationcalories1.round();
        _text_operation = "Restantes";
      }
    } else {
      _mtb = ((655 + (9.6 * weight)) + ((1.8 * height) - (4.7 * age)));
      _resultCalories = (_mtb * activity).round();
      _lowcalories = _resultCalories - 500;
      _operationcalories1 = _resultCalories - _calories;
      if (_operationcalories1 < 0) {
        _operation_calories_final = (_operationcalories1.abs()).round();
        _text_operation = "*Pasadas";
      } else {
        _operation_calories_final = _operationcalories1.round();
        _text_operation = "Restantes";
        //aquí niñoooo
      }
    }
    return _resultCalories;
  }

  Future init2() async {
    try {
      final recipes2 =
          await RecordCaloriesStatus.getRecipes(_datetoday, _id_user);
      if (recipes2.length > 0) {
        final calories = recipes2[0].calories;
        if (calories != null) {
          _calories = recipes2[0].calories!;
          _protein = recipes2[0].protein!;
          _fat = recipes2[0].fat!;
          _carbs = recipes2[0].carbs!;
          _sugar = recipes2[0].sugar!;
          _sodium = recipes2[0].sodium!;
          _idstatus = recipes2[0].id_status!;
          _statusname = recipes2[0].name_status!;

          switch (_statusname) {
            case "No haz registrado":
              _changecolor = Colors.grey;
              _changecolor2 = Colors.yellow.shade400;
              break;
            case "Vas bien":
              _changecolor = Colors.blue;
              _changecolor2 = Colors.yellow.shade400;
              break;
            case "Equilibrado":
              _changecolor = Colors.green;
              _changecolor2 = Colors.yellow.shade400;
              break;
            case "Excedido":
              _changecolor = Colors.red;
              _changecolor2 = Colors.red;
              break;
          }
        } else {
          _calories = 0;
          _protein = 0;
          _fat = 0;
          _carbs = 0;
          _sugar = 0;
          _sodium = 0;
          _idstatus = 0;
          _statusname = "No haz registrado";
          CaloriesdataSet(0, 0, 0, 0, 0, 0);
          _changecolor = Colors.grey;
          _changecolor2 = Colors.yellow.shade400;
        }
      }
      if (this.mounted) {
        // check whether the state object is in tree
        setState(() => this.recipes2 = recipes2);
      }
    } catch (e) {
      Navigator.pushReplacementNamed(context, "/login");
      _mensajeERROR(context);
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

  Future<void> _refresh() {
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
                              color: _changecolor2,
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
                                    Navigator.pushNamed(
                                        //context, "/miperfil", arguments:
                                        //  context, "/historialcomida",
                                        context,
                                        "/miperfil",
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
                                            data.value_level,
                                            data.fb_complete));
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
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/login',
                                      (Route<dynamic> route) => false);
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Tu cálculo",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: Colors.deepOrange[300],
                                                decoration:
                                                    TextDecoration.none),
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
                                        '$_operation_calories_final' + " cal",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.deepOrange[400],
                                            decoration: TextDecoration.none),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            '$_text_operation',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: Colors.deepOrange[300],
                                                decoration:
                                                    TextDecoration.none),
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
                                        '$_statusname',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.5,
                                            color: _changecolor,
                                            decoration: TextDecoration.none),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            " Estatus",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: Colors.deepOrange[300],
                                                decoration:
                                                    TextDecoration.none),
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
                                      Navigator.pushNamed(
                                          context, "/tipocomida",
                                          arguments: SendUserDataInfo(
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
                                              data.value_level,
                                              _resultCalories,
                                              _calories,
                                              _idstatus,
                                              data.fb_complete));
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
                                    'Bienvenido: ' +
                                        data.name +
                                        " " +
                                        data.surname,
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
                                  "¿Cómo vas en tu alimentación de hoy?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
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
                                        AssetImage("images/icon/caloria.png"),
                                        color: Colors.green,
                                      ),
                                      padding: EdgeInsets.all(11),
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
                                            "Hoy llevas consumido " +
                                                '$_calories' +
                                                " cal.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.green[900],
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            "Tienes " +
                                                '$_operation_calories_final' +
                                                " cal. " +
                                                _text_operation +
                                                " según tu cálculo calorico para mantener tu peso.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[500],
                                                decoration:
                                                    TextDecoration.none),
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
                            controller:
                                ScrollController(keepScrollOffset: false),
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
                                      padding: EdgeInsets.all(11),
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
                                            "Calorias para bajar de peso necesitas: " +
                                                _lowcalories.toString() +
                                                " cal.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.green[900],
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            "Lo recomendable por día, en base a tus calorias iniciales.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[500],
                                                decoration:
                                                    TextDecoration.none),
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
                            controller:
                                ScrollController(keepScrollOffset: false),
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
                                        AssetImage(
                                            "images/icon/grasas-trans.png"),
                                        color: Colors.green,
                                      ),
                                      padding: EdgeInsets.all(11),
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
                                                '$_fat' +
                                                "g de grasas totales.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.green[900],
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            "Totales de grasas registradas al día de hoy.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[500],
                                                decoration:
                                                    TextDecoration.none),
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
                            controller:
                                ScrollController(keepScrollOffset: false),
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
                                        AssetImage("images/icon/proteina.png"),
                                        color: Colors.green,
                                      ),
                                      padding: EdgeInsets.all(11),
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
                                                '$_protein' +
                                                "g de proteina. ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.green[900],
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            "Proteina registrada del día de hoy.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[500],
                                                decoration:
                                                    TextDecoration.none),
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
                            controller:
                                ScrollController(keepScrollOffset: false),
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
                                        AssetImage(
                                            "images/icon/carbohidrato.png"),
                                        color: Colors.green,
                                      ),
                                      padding: EdgeInsets.all(11),
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
                                                '$_carbs' +
                                                "g de carb.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.green[900],
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            "Carbohidratos registrado del día de hoy.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[500],
                                                decoration:
                                                    TextDecoration.none),
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
                            controller:
                                ScrollController(keepScrollOffset: false),
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
                                        AssetImage("images/icon/azucar.png"),
                                        color: Colors.green,
                                      ),
                                      padding: EdgeInsets.all(11),
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
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            "Azucares registrado del día de hoy.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[500],
                                                decoration:
                                                    TextDecoration.none),
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
                            controller:
                                ScrollController(keepScrollOffset: false),
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

  void _mensajeERROR(BuildContext context) {
    Dialogs.materialDialog(
        color: Colors.white,
        msg: "Vuelve a iniciar sesión o intenta más tarde.",
        title: "Hubo un error",
        lottieBuilder: Lottie.asset(
          'images/19230-payment-failed.json',
          height: 25,
          width: 25,
        ),
        context: context,
        actions: [
          IconsButton(
            onPressed: () {},
            text: 'Haz Tap en cualquier parte de la pantalla',
            iconData: Icons.close,
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
