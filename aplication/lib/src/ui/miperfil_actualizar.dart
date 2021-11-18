import 'dart:convert';
import 'package:apponertesano/src/blocs/search_api.dart';
import 'package:apponertesano/src/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

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

  dynamic _value = 1;
  String valueactivity = "";

  List<String> items = <String>[
    'Seleccione su sexo aquí',
    'Masculino',
    'Femenino',
  ];
  List<InfoDatauser> user = [];
  String rname = "";
  String rsurname = "";
  int rage = 0;
  double rweight = 0;
  String rgender = "";
  double rheight = 0;
  int rid_activity = 0;
  int id_user = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      init();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future init() async {
    final recipes2 = await InfoUser.getRecipes(id_user);
    if (recipes2.length > 0) {
      txtname.text = recipes2[0].name!;
      txtsurname.text = recipes2[0].surname!;
      txtage.text = recipes2[0].age!.toString();
      txtpeso.text = recipes2[0].weight!.toString();
      _txtaltura.text = recipes2[0].height!.toString();
      // _value = recipes2[0].id_activity!.toString();
      // print(_value + " API");
    }

    if (this.mounted) {
      // check whether the state object is in tree
      setState(() => this.user = user);
    }
  }

  @override
  Widget build(BuildContext context) {
    UsuariodataSet data =
        ModalRoute.of(context)!.settings.arguments as UsuariodataSet;
    id_user = data.id_user;
    rgender = data.gender;
    print(_value);
    // _value = data.value_level;
    // valueactivity = data.value_level.toString();
    //  print(valueactivity);
    /*  switch (valueactivity) {
      case '1.2':
        _value = 1;
        break;
      case '1.375':
        _value = 2;
        break; 
      case '1.550':
        _value = 3;
        break;
    }
    ;*/

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
                        value: rgender,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        onChanged: (String? newValue) {
                          setState(() {
                            rgender = newValue!;
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
                              value: 1,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
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
                                  _value = value;
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
                                  _value = value;
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
                                  _value = value;
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
                                  _value = value;
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
          _mensajeactualizar(context);
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

  void _mensajeactualizar(BuildContext context) {
    Dialogs.bottomMaterialDialog(
        msg: '¿Esta seguro que quiere actualizar tus datos?',
        title: 'Actualizar datos',
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
              actualizarUsu(
                  context,
                  txtname.text,
                  txtsurname.text,
                  int.parse(txtage.text),
                  double.parse(txtpeso.text),
                  rgender,
                  double.parse(_txtaltura.text),
                  _value,
                  id_user);
            },
            text: 'Actualizar',
            iconData: Icons.border_color_rounded,
            color: Colors.green,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }

  void _mensajeSuccess(BuildContext context, String nombre) {
    Dialogs.materialDialog(
        color: Colors.white,
        msg: 'Se actualizarón correctamente tus datos   (tap para salir)',
        title: nombre + ', actualización exitoso',
        lottieBuilder: Lottie.asset(
          'images/3152-star-success.json',
          height: 25,
          width: 25,
        ),
        context: context,
        actions: []);
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

  

    if (response.statusCode == 200) {
      List<UsuarioDataupdate> lista = parsePostupdate(response.body);
      if (lista.length > 0) {
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

        _mensajeSuccess(context, name);
      } else {
        _showDialog(context, 'No existe el usuario en la aplicación');
      }
      return lista;
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
}
