import 'package:apponertesano/src/model/user.dart';
import 'package:flutter/material.dart';

// Define un widget de formulario personalizado
class Miperfil extends StatefulWidget {
  const Miperfil({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MiperfilState();
}

class _MiperfilState extends State<Miperfil> {
  final _formKeymiperfil = GlobalKey<FormState>();
  int currenttIndex = 1;

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    //  args = ModalRoute.of(context).settings.arguments;
    UsuariodataSet data =
        ModalRoute.of(context)!.settings.arguments as UsuariodataSet;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi perfil'),
        backgroundColor: Colors.lightGreen.shade600,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 20),
        child: Form(
          key: _formKeymiperfil,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 1),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Tus datos Personales",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Colors.red,
                                  decoration: TextDecoration.none),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: Colors.amber[50],
                        elevation: 5,
                        child: ListTile(
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data.name + " " + data.surname,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.green[600],
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          title: Text(
                            "Nombre",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.deepOrange[300],
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: Colors.amber[50],
                        elevation: 5,
                        child: ListTile(
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data.age.toString() + " años",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.green[600],
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          title: Text(
                            "edad",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.deepOrange[300],
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: Colors.amber[50],
                        elevation: 5,
                        child: ListTile(
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data.gender,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.green[600],
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          title: Text(
                            "Genero",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.deepOrange[300],
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
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
                                        "Peso",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.deepOrange[300],
                                            decoration: TextDecoration.none),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            data.weight.toString() + " kg",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.green[600],
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
                                        "Altura",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.deepOrange[300],
                                            decoration: TextDecoration.none),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            data.height.toString() + " Cm",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.green[600],
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
                    ),
                    SizedBox(
                      height: 5,
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
                                        "Nivel de actividad",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.deepOrange[300],
                                            decoration: TextDecoration.none),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            data.name_level,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.green[600],
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
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 1),
                              child: FloatingActionButton(
                                heroTag: Text("btn1"),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/miperfilactu",
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
                                child: const Icon(Icons.border_color_rounded),
                                backgroundColor: Colors.green,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 1),
                              child: FloatingActionButton( 
                                heroTag: Text("btn2"),
                                onPressed: () {
                                    Navigator.pushNamed(
                                      context, "/historialdia",
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
                                child: const Icon(Icons.today_rounded),
                                backgroundColor: Colors.green,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 1),
                              child: FloatingActionButton(
                                heroTag: Text("btn3"),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, "/historialcomida",
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
                                child: const Icon(Icons.date_range),
                                backgroundColor: Colors.green,
                              ),
                            )
                          ]),
                    ),
                    Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 5, 5, 1),
                            child: Text(
                              "Actualizar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(8, 5, 8, 1),
                            child: Text(
                              "Historial hoy",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(8, 5, 5, 1),
                            child: Text(
                              "Mi historial",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey,
                                  decoration: TextDecoration.none),
                            ),
                          )
                        ]))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
