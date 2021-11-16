import 'dart:convert';
import 'package:apponertesano/src/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apponertesano/src/resources/userData.dart' as globals;

// Define un widget de formulario personalizado
class Miperfilactu extends StatefulWidget {
  const Miperfilactu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MiperfilactuState();
}

class _MiperfilactuState extends State<Miperfilactu> {
  final _formKeyactuperfil = GlobalKey<FormState>();
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

  dynamic _value = 0;

  String dropdownvalue = 'Seleccione su sexo aquí';

  List<String> items = <String>[
    'Seleccione su sexo aquí',
    'Masculino',
    'Femenino',
  ];

  String rname = "";
  String rsurname = "";
  int rage = 0;
  double rweight = 0;
  String rgender = "";
  double rheight = 0;
  int rid_activity = 0;
  int id_user = 0;
  
  @override
  Widget build(BuildContext context) {
    //  args = ModalRoute.of(context).settings.arguments;
     UsuariodataSet data =
        ModalRoute.of(context)!.settings.arguments as UsuariodataSet;
    rname = data.name;
    rgender = data.gender;
    txtname.text = data.name;
    txtsurname.text = data.surname;
    txtpeso.text = data.weight.toString();
    _txtaltura.text = data.height.toString();
    txtage.text = data.age.toString();
    //_value = data.value_level;
    id_user = data.id_user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar perfil'),
        backgroundColor: Colors.lightGreen.shade600,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 20),
        child: Form(
          key: _formKeyactuperfil,
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
                      ),
                    ),
                    SizedBox(height: 15),
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
                    SizedBox(height: 15),
                    Container(
                      width: 300.0,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value == "" || value.isEmpty) {
                            return 'Ingresa tu edad';
                          }
                          return null;
                        },
                        controller: txtage,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          labelText: 'Edad',
                          prefixIcon: Icon(Icons.verified_user),
                        ),
                      ),
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
                                padding: EdgeInsets.fromLTRB(30, 1, 5, 1),
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                            child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 1, 5, 1),
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
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                  labelText: 'Estatura(Cm)',
                                  prefixIcon: Icon(Icons.height_outlined),
                                ),
                              ),
                            ),
                          ),
                        ])),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 250.0,
                      child: DropdownButtonFormField<String>(
                        key: _dropdowngener,
                        value: data.gender,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            rgender = dropdownvalue;
                          });
                        },
                        validator: (value) {
                          if (value == 'Seleccione su sexo aquí') {
                            return 'Seleccione su genero';
                          }
                        },
                        items:
                            items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 330.0,
                      child: Column(children: <Widget>[
                        Text("Nivel de actividad fisica",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              key: _txtfisico,
                              value: 1,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 1;
                                  rid_activity = _value;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            Text("No hago nada de ejercicio"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              value: 2,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 2;
                                  rid_activity = _value;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            Text("Ejercicio de 1 a 3 veces por semana"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              value: 3,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 3;
                                  rid_activity = _value;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            Text("Ejercicio de 3 a 5 veces por semana"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              value: 4,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 4;
                                  rid_activity = _value;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            Text("Ejercicio de 6 a 7 veces por semana"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              value: 5,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 5;
                                  rid_activity = _value;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            Text("Entrenamientos de más de 4 horas diarias"),
                          ],
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RegistrarButton(context),
                  ],
                ),
              ),
            ],

          ),
          
        ),
      ),
    );
  }

  Widget RegistrarButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (_formKeyactuperfil.currentState!.validate()) {
          actualizarUsu(
              context,
              txtname.text,
              txtsurname.text,
              int.parse(txtage.text),
              double.parse(txtpeso.text),
              rgender,
              double.parse(_txtaltura.text),
              rid_activity,
              id_user);
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      minWidth: 200.0,
      height: 45.0,
      color: Colors.green.shade600,
      child:
          Text('Actualizar mis datos', style: TextStyle(color: Colors.white)),
    );
  }
}

Future actualizarUsu(
  BuildContext context,
  String name,
  String surname,
  int? age,
  double? weight,
  String gender,
  double? height,
  int? id_activity,
  int? id_user,
) async {
  Map data = {
    'name': name,
    'surname': surname,
    'weight': weight,
    'age': age,
    'gender': gender,
    'height': height,
    'id_activity': id_activity,
    'id_user': id_user
  };
  var body = json.encode(data);

  final response = await http.put(
      Uri.parse("https://apiapponertesano.azurewebsites.net/api/update"),
      headers: {"Content-Type": "application/json"},
      body: body);

  final value = json.decode(response.body)["statusCode"];

  if (response.statusCode == 200) {
    _showDialog(context, 'Se actualizo correctamente tus datos');
  } else {
    _showDialog(context, 'No se Actualizo, intenta nuevamente');
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
