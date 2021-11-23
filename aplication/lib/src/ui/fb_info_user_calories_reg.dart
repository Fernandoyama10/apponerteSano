import 'dart:convert';
import 'package:apponertesano/src/resources/facebook_login_result.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:apponertesano/src/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Define un widget de formulario personalizado
class FBInfoUserCaloriesReg extends StatefulWidget {
  //la llave validadora
  const FBInfoUserCaloriesReg({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _InfoUserCaloriesRegState();
}

class _InfoUserCaloriesRegState extends State<FBInfoUserCaloriesReg> {
  final txtage = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  final txtpeso = TextEditingController();
  final _txtfisico = GlobalKey<FormState>();
  final _dropdowngener = GlobalKey<FormState>();
  final _txtaltura = TextEditingController();
  int fb_complete = 0;
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
  int fb_completed = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late UserDat data = ModalRoute.of(context)!.settings.arguments as UserDat;
    remail = data.email;
    rpassword = data.id;
    print(rpassword);
    var string = data.name;
    var splitag = string.split(" ");
    rname = splitag[0];
    rsurname = splitag[1];

    print(rname);
    print(rsurname);
    return Scaffold(
      appBar: AppBar(
        title: Text('Antes de continuar:'),
        backgroundColor: Colors.lightGreen.shade600,
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Colors.lightGreen.shade50,
                  Colors.lightGreen.shade200,
                ]),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey1,
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                //primer elemento del listview
                SizedBox(height: 30),
                Container(
                  child: Text(
                    "Gracias, ¡Por ultimo, te ayudamos a controlar tus calorias!",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.green.shade800,
                        decoration: TextDecoration.none),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32),
                ),

                SizedBox(height: 35),
                Container(
                  width: 250.0,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return 'Ingresa tu edad';
                      }
                      return null;
                    },
                    controller: txtage,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      labelText: 'Edad',
                      prefixIcon: Icon(Icons.verified_user),
                    ),
                    onChanged: (text) {
                      setState(() => rage = int.parse(text));
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 250.0,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return 'Ingresa tu peso';
                      }
                      return null;
                    },
                    controller: txtpeso,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      labelText: 'Peso (Kg):',
                      prefixIcon: Icon(Icons.monitor_weight),
                    ),
                    onChanged: (text) {
                      setState(() => rweight = double.parse(text));
                    },
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  width: 250.0,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return 'Ingresa tu estatura en cm';
                      }
                      if (value.length <= 2) {
                        return 'Ingresa tu estatura en cm ej: 186';
                      }
                      return null;
                    },
                    controller: _txtaltura,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      labelText: 'Estatura(Cm)',
                      prefixIcon: Icon(Icons.height_outlined),
                    ),
                    onChanged: (text) {
                      setState(() => rheight = double.parse(text));
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 250.0,
                  child: DropdownButtonFormField<String>(
                    key: _dropdowngener,
                    value: dropdownvalue,
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
                    items: items.map<DropdownMenuItem<String>>((String value) {
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

                SizedBox(height: 30),
                //botón
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  RegistrarButton(context),
                  SizedBox(width: 10),
                  RegistrarButton2(context),
                ]),

                Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                      ),
                    ]),

                SizedBox(height: 20),
              ],
            )),
          )),
    );
  }

  Widget RegistrarButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (_formKey1.currentState!.validate()) {
          registrarUsu(context, remail, rpassword, rid_role, rname, rsurname,
              rage, rweight, rgender, rheight, rid_activity, fb_complete);
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      minWidth: 150.0,
      height: 45.0,
      color: Colors.green.shade600,
      child: Text('Registrarme', style: TextStyle(color: Colors.white)),
    );
  }

  Widget RegistrarButton2(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Provider.of<FacebookSignInController>(context, listen: false).logOut();
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      minWidth: 150.0,
      height: 45.0,
      color: Colors.red.shade600,
      child: Text('Cancelar', style: TextStyle(color: Colors.white)),
    );
  }

  Future registrarUsu(
      BuildContext context,
      String email,
      String password,
      int id_role,
      String name,
      String surname,
      int? age,
      double? weight,
      String gender,
      double? height,
      int? id_activity,
      int? fb_complete) async {
    Map data = {
      'email': email,
      'password': password,
      'id_role': id_role,
      'name': name,
      'surname': surname,
      'weight': weight,
      //gogle
      'age': age,
      'gender': gender,
      'height': height,
      'id_activity': id_activity,
      'fb_complete': fb_complete
    };
    var body = json.encode(data);

    final response = await http.post(
        Uri.parse("http://apiapponertesano.azurewebsites.net/api/register"),
        headers: {"Content-Type": "application/json"},
        body: body);

    final value = json.decode(response.body)["statusCode"];

    if (response.statusCode == 200) {
      if (value == 400) {
        _showDialog(context, 'Usuario ya registrado anteriormente');
      } else {
        Navigator.pushReplacementNamed(context, '/splashloading');
      }
    } else {
      throw Exception('No se Agrego, intenta nuevamente');
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
