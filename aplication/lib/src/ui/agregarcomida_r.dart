import 'dart:convert';
import 'package:apponertesano/src/model/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:apponertesano/src/model/food.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  String name = "";
  int id_estatus = 4;
  String type = "";
  dynamic initial_calories = 0;
  int fb_iscompleted = 0;
  dynamic valuefeed = 0;
  int fbstatus = 1;
  @override
  Widget build(BuildContext context) {
    GetRecipeYuc args =
        ModalRoute.of(context)!.settings.arguments as GetRecipeYuc;
    //porciones
    yields = args.yield;
    label = args.label;
    image = args.image;
    id_user = args.id_user;
    type = args.tipo;
    name = args.name;
    initial_calories = args.initialcalories;
    fb_iscompleted = args.fb_complete;
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
                      child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          height: 200,
                          width: 250,
                          imageUrl: args.image,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Image.asset(
                                'images/page-not-found.png',
                                fit: BoxFit.fill,
                              )),
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
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Tamaño de la Porciones: ' +
                            (args.yield).toStringAsFixed(0) +
                            ' (' +
                            args.tipo +
                            ')',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 2,
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
                            carbsyield =
                                (args.quantitychocdf * double.parse(value));
                            proteyield =
                                (args.quantityprocnt * double.parse(value));
                            sugaryield =
                                (args.quantitysugar * double.parse(value));
                            sodiumyield =
                                (args.quantityna * double.parse(value));
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
                        'Porciones: ' +
                            (args.yield).toStringAsFixed(0) +
                            ' (' +
                            args.tipo +
                            ')',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Calorias por porción: ' +
                            (args.calories).toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Calorias totales: ' + caloriesyield.toStringAsFixed(2),
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
          _mensajeRegistrar(context);
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

  void _mensajeFeedback(BuildContext context) {
    Alert(
        context: context,
        title: "Porfavor calificanos",
        content: Form(
          child: Column(
            children: <Widget>[
              Container(
                width: 330.0,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text("Valorar nuestra aplicación nos ayuda a mejorar.",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      valuefeed = rating;
                      print(rating);
                    },
                  ),
                ]),
              ),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            onPressed: () => {
              if (valuefeed == 0)
                {_nostarselected(context)}
              else
                {
                  Navigator.pop(context),
                  registrarfeedback(
                    context,
                    id_user,
                    fbstatus,
                    valuefeed,
                  ),
                }
            },
            child: Text(
              "Calificar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  void _nostarselected(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Advertencia!"),
          content: new Text("No haz seleccionado una estrella"),
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

  void _mensajeRegistrar(BuildContext context) {
    Dialogs.bottomMaterialDialog(
        msg: '¿Esta seguro que quiere guardar este registro?',
        title: 'Registrar esta comida',
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
                  initial_calories);
            },
            text: 'Registrar',
            iconData: Icons.save,
            color: Colors.green,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }

  void _mensajeSuccess(BuildContext context, String nombre) {
    Dialogs.materialDialog(
        color: Colors.white,
        msg: 'Esta comida fue agregada a tu historial de hoy',
        title: nombre + ', registro exitoso',
        lottieBuilder: Lottie.asset(
          'images/62669-success-lottie-animation.json',
          height: 25,
          width: 25,
        ),
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              if (fb_iscompleted == 0) {
                Navigator.pop(context);
                _mensajeFeedback(context);
              } else if (fb_iscompleted == 1) {
                Navigator.pop(context);
              }
            },
            text: 'Aceptar',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }

  void _graciascomentarios(BuildContext context, String nombre) {
    Dialogs.materialDialog(
        color: Colors.white,
        msg: 'Haz click en cualquier parte de la pantalla para cerrar.',
        title: nombre + ', gracias por tus comentarios!',
        lottieBuilder: Lottie.asset(
          'images/3152-star-success.json',
          height: 25,
          width: 25,
        ),
        context: context,
        actions: []);
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
    int? initial_calories,
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
      'initial_calories': initial_calories,
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
        _showDialog(context, 'Error 404, contacta administrador');
      } else {
        _mensajeSuccess(context, name);
      }
    } else {
      throw Exception('No se Agrego, intenta nuevamente');
    }
  }

  Future registrarfeedback(
    BuildContext context,
    int? id_user,
    dynamic fb_iscompleted,
    dynamic value_feed,
  ) async {
    Map data = {
      'value_feed': value_feed,
      'id_user': id_user,
      'fb_complete': fb_iscompleted,
    };
    var body = json.encode(data);

    final response = await http.post(
        Uri.parse("http://apiapponertesano.azurewebsites.net/api/savefeedback"),
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

        _graciascomentarios(context, name);
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
