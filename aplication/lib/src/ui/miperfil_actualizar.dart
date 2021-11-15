import 'package:apponertesano/src/model/user.dart';
import 'package:flutter/material.dart';

// Define un widget de formulario personalizado
class Miperfilactu extends StatefulWidget {
  const Miperfilactu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MiperfilactuState();
}

class _MiperfilactuState extends State<Miperfilactu> {
  final _formKey1 = GlobalKey<FormState>();
  int currenttIndex = 1;

  final txtpeso = TextEditingController();
  final _txtfisico = GlobalKey<FormState>();
  final _dropdowngener = GlobalKey<FormState>();
  final _txtaltura = TextEditingController();
  final txtname = TextEditingController();
  final txtsurname = TextEditingController();
  final txtage = TextEditingController();

  String email = "";
  String password = "";

  bool isVisible = false;

  int _value = 0;

  String dropdownvalue = 'Seleccione su sexo aquí';
  List<String> items = <String>[
    'Seleccione su sexo aquí',
    'Masculino',
    'Femenino',
  ];
  String remail = "";
  String rpassword = "";
  int rid_role = 2;
  String rname = "";
  String rsurname = "";
  int rage = 0;
  double rweight = 0;
  String rgender = "";
  double rheight = 0;
  int rid_activity = 0;

  @override
  Widget build(BuildContext context) {
    //  args = ModalRoute.of(context).settings.arguments;
    UsuariodataSet data =
        ModalRoute.of(context)!.settings.arguments as UsuariodataSet;
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar perfil'),
        backgroundColor: Colors.lightGreen.shade600,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 20),
        child: Form(
          key: _formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Actualiza tus datos",
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
                    Container(
                      width: 300.0,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value == "" || value.isEmpty) {
                            return 'Ingresa tu nombre';
                          }
                          if (value.length < 3) {
                            return 'Ingresa un nombre real ';
                          }
                          return null;
                        },
                        controller: txtname,
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          labelText: 'Nombre:',
                          prefixIcon: Icon(Icons.verified_user),
                        ),
                        onChanged: (text) {
                          setState(() => email = data.email);
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Flexible(
                            child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(45, 1, 1, 1),
                            child: Container(
                              width: 150.0,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null ||
                                      value == "" ||
                                      value.isEmpty) {
                                    return 'Ingresa tu estatura en cm';
                                  }
                                  if (value.length <= 2) {
                                    return 'Ingresa tu estatura en cm ej: 186';
                                  }
                                  return null;
                                },
                                controller: _txtaltura,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 5, 5, 0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                  labelText: 'Estatura(Cm)',
                                  prefixIcon: Icon(Icons.height_outlined),
                                ),
                                onChanged: (text) {
                                  setState(() => rheight = double.parse(text));
                                },
                              ),
                            ),
                          ),
                        ])),
                        Flexible(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(0.2),
                                child: Container(
                                  width: 150.0,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value == "" ||
                                          value.isEmpty) {
                                        return 'Ingresa tu peso';
                                      }
                                      return null;
                                    },
                                    controller: txtpeso,
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0)),
                                      labelText: 'Peso (Kg):',
                                      prefixIcon: Icon(Icons.monitor_weight),
                                    ),
                                    onChanged: (text) {
                                      setState(
                                          () => rweight = double.parse(text));
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value == "" || value.isEmpty) {
                            return 'Ingresa tus apellidos';
                          }
                          if (value.length <= 8) {
                            return 'Ingresa tu apellido mayor a 8 caracteres';
                          }
                          return null;
                        },
                        controller: txtsurname,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          labelText: 'Apellidos',
                          prefixIcon: Icon(Icons.verified_user),
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 1),
                              child: FloatingActionButton(
                                heroTag: Text("btn1"),
                                onPressed: () {},
                                child: const Icon(Icons.border_color_rounded),
                                backgroundColor: Colors.green,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 1),
                              child: FloatingActionButton(
                                heroTag: Text("btn2"),
                                onPressed: () {},
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currenttIndex,
        selectedItemColor: Colors.lightGreen.shade500,
        unselectedItemColor: Colors.lightGreen.shade800,
        backgroundColor: Colors.grey.shade200,
        onTap: (index) => setState(() {
          currenttIndex = index;
        }),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_sharp,
              color: Colors.lightGreen.shade600,
            ),
            label: 'Mi perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.lightGreen.shade600,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.lightGreen.shade600,
            ),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
