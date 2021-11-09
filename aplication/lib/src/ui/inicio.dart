import 'package:apponertesano/src/model/user.dart';
import 'package:apponertesano/src/resources/facebook_login_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Define un widget de formulario personalizado
class Diseno extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DisenoState();
}

class _DisenoState extends State<Diseno> {
// log aout
  //clase choice

  double _height = 0;
  double _weight = 0;
  int _age = 0;
  double _activity = 0;
  String _gender = "";
  int _resultCalories = 0;
  double _mtb = 0;

  void calculateCalories(height, weight, age, activity, gender) {
    if (gender == "Masculino") {
      _mtb = ((66 + (13.7 * weight)) + ((5 * height) - (6.8 * age)));
      _resultCalories = (_mtb * activity).round();
      print(_resultCalories);
    } else {
      _mtb = ((655 + (9.6 * weight)) + ((1.8 * height) - (4.7 * age)));
      _resultCalories = (_mtb * activity).round();
    }
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

    calculateCalories(_height, _weight, _age, _activity, _gender);

    return Container(
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
                      _resultCalories.toString(),
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
                                //Navigator.pushNamed(context, '/usuario',arguments: datosArguments(args.id_usu,args.id_salon, args.nombre,args.ape_1,args.ape_2,args.telefono,args.clave,args.escuela,args.usuario,args.contra,args.numero,args.letra,args.puntos));
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
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(243, 245, 248, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: Icon(
                              Icons.calculate_rounded,
                              color: Colors.red,
                              size: 30,
                            ),
                            padding: EdgeInsets.all(12),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            _resultCalories.toString() + "cal. iniciales",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(243, 245, 248, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: Icon(
                              Icons.report_sharp,
                              color: Colors.red,
                              size: 30,
                            ),
                            padding: EdgeInsets.all(12),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "1500 cal. restantes",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(243, 245, 248, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: Icon(
                              Icons.person_pin_circle,
                              color: Colors.red,
                              size: 30,
                            ),
                            padding: EdgeInsets.all(12),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          //llamar a la variable: args.usuario
                          Text(
                            "Excelente trabajo!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white,
                                decoration: TextDecoration.none),
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
                                  Navigator.pushNamed(context, '/tipocomida');
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
                                'Bienvenido: ' + data.name,
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
                                  child: Icon(
                                    Icons.check_circle_rounded,
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
                                        "llevas consumido 1500 cal. hoy",
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
                                  child: Icon(
                                    Icons.check_circle_rounded,
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
                                        "llevas 400g de grasas totales",
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
                                  child: Icon(
                                    Icons.check_circle_rounded,
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
                                        "llevas 40g de proteina ",
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
                                  child: Icon(
                                    Icons.check_circle_rounded,
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
                                        "Llevas 150g de carb.",
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
                        height: 36,
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
