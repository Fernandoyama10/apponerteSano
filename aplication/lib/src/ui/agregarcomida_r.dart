import 'dart:convert';

import 'package:apponertesano/src/model/food.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AgregarRegional extends StatefulWidget {
  const AgregarRegional({Key? key}) : super(key: key);

  @override
  _AgregarScreenState createState() => _AgregarScreenState();
}

class _AgregarScreenState extends State<AgregarRegional> {
  final _formKey1 = GlobalKey<FormState>();
  double yields = 1;
  double proteyield = 0;
  double carbsyield = 0;
  double sugaryield = 0;
  double caloriesyield = 0;
  double sodiumyield = 0;
  double fatyield = 0;
  String dropdownvalue = '0';
  var items = ['0', '1', '2', '3', '4', '5', '6', '7', '8'];
  String label = "";
  String image = "";
  String datetoday = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String timetoday = DateFormat('hh:mm:ss').format(DateTime.now());
  int id_user = 0;
  int id_estatus = 4;
  String type = "";
  @override
  Widget build(BuildContext context) {
    GetRecipeYuc args = ModalRoute.of(context)!.settings.arguments as GetRecipeYuc;
    //porciones
    yields = args.yield;
    label = args.label;
    image = args.image;
    id_user = args.id_user;
    type = args.tipo;
    //operaciones

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registrar tu alimento'),
          backgroundColor: Colors.lightGreen.shade600,
          centerTitle: true,
        ),
        body: Form(
          key: _formKey1,
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  Hero(
                    tag: args.label,
                    child: Image.network(
                      args.image,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Column(
                  children: [
                    const Text(
                      "Selecciona tu porción:",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    DropdownButtonFormField<String>(
                      value: dropdownvalue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                          dynamic value = dropdownvalue;
                                        caloriesyield =
                              (args.calories * double.parse(value));
                          carbsyield = (args.quantitychocdf * double.parse(value));
                          proteyield = (args.quantityprocnt * double.parse(value));
                          sugaryield = (args.quantitychocdf * double.parse(value));
                          sodiumyield = (args.quantityna * double.parse(value));
                          fatyield = (args.quantityfat * double.parse(value));
                        });
                      },
                      validator: (value) {
                        if (value == '0') {
                          return 'Seleccione primero su porción';
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            strutStyle: StrutStyle(fontSize: 28.0),
                            text: TextSpan(
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                text: args.label),
                          ),
                        ),
                        AddButton(context),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Porciones: ' + (args.yield).toStringAsFixed(0) + ' (' + args.tipo + ')',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Calorias totales: ' + (args.calories).toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Calorias por porcion: ' +
                          caloriesyield.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    const Text(
                      "Información Nutrimental:",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: Colors.amber[50],
                        elevation: 5,
                        child: ListTile(
                          title: Text(
                            "Proteinas:",
                          ),
                          subtitle: Row(
                            children: [
                              Text(dropdownvalue +
                                  ' porción(es): ' +
                                  proteyield.toStringAsFixed(2) +
                                  ' gr'),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: Colors.amber[50],
                        elevation: 5,
                        child: ListTile(
                          title: Text(
                            "Grasa:",
                          ),
                          subtitle: Row(
                            children: [
                              Text(dropdownvalue +
                                  ' porción(es): ' +
                                  fatyield.toStringAsFixed(2) +
                                  ' gr'),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: Colors.amber[50],
                        elevation: 5,
                        child: ListTile(
                          title: Text(
                            "Carbohidratos:",
                          ),
                          subtitle: Row(
                            children: [
                              Text(dropdownvalue +
                                  ' porción(es): ' +
                                  carbsyield.toStringAsFixed(2) +
                                  ' gr'),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: Colors.amber[50],
                        elevation: 5,
                        child: ListTile(
                          title: Text(
                            "Azucar:",
                          ),
                          subtitle: Row(
                            children: [
                              Text(dropdownvalue +
                                  ' porción(es): ' +
                                  sugaryield.toStringAsFixed(2) +
                                  ' gr'),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: Colors.amber[50],
                        elevation: 5,
                        child: ListTile(
                          title: Text(
                            "Sodio:",
                          ),
                          subtitle: Row(
                            children: [
                              Text(dropdownvalue +
                                  ' porción(es): ' +
                                  sodiumyield.toStringAsFixed(2) +
                                  ' mg'),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }

  Widget AddButton(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        Icons.add,
        color: Colors.white,
        size: 24.0,
      ),
      label: Text('Agregar a dieta de Hoy'),
      onPressed: () {
        if (_formKey1.currentState!.validate()) {
          registrarFood(
            context,
            datetoday,
            timetoday,
            label,
            image,
            type,
            dropdownvalue,
            caloriesyield,
            proteyield,
            fatyield,
            carbsyield,
            sugaryield,
            sodiumyield,
            id_user,
            id_estatus,
          );
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

Future registrarFood(
  BuildContext context,
  String date_r,
  String time,
  String label,
  String image,
  String type,
  dynamic yieldd,
  double? calories,
  double? protein,
  double? fat,
  double? carbs,
  double? sugar,
  double? sodium,
  int? id_user,
  int? id_estatus,
) async {
  Map data = {
    'date_r': date_r,
    'time': time,
    'label': label,
    'image': image,
        'type': type,
    'quantity': yieldd,
    'calories': calories,
    //gogle
    'protein': protein,
    'fat': fat,
    'carbs': carbs,
    'sugar': sugar,
    'sodium': sodium,
    'id_user': id_user,
    'id_status': id_estatus,
  };
  var body = json.encode(data);

  final response = await http.post(
      Uri.parse(
          "http://apiapponertesano.azurewebsites.net/apinterfood/register"),
      headers: {"Content-Type": "application/json"},
      body: body);

  final value = json.decode(response.body)["statusCode"];

  if (response.statusCode == 200) {
    if (value == 400) {
      _showDialog(context, 'Error en el registro');
    } else {
      _showDialog(context, 'Registro exitoso');
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
