import 'package:apponertesano/src/model/food.dart';
import 'package:flutter/material.dart';


class ConsultarComida extends StatefulWidget {
  const ConsultarComida({Key? key}) : super(key: key);

  @override
  _ConsultarComidaScreenState createState() =>
      _ConsultarComidaScreenState();
}

class _ConsultarComidaScreenState extends State<ConsultarComida> {
  final _formKey1 = GlobalKey<FormState>();
  double yields = 0;
  double proteyield = 0;
  double carbsyield = 0;
  double sugaryield = 0;
  double caloriesyield = 0;
  double sodiumyield = 0;
  double fatyield = 0;
  String label = "";
  String image = "";
  
  int id_estatus = 4;
  @override
  Widget build(BuildContext context) {
    GetDetailFood args = ModalRoute.of(context)!.settings.arguments as GetDetailFood;
    //porciones
    yields = args.quantity;
    label = args.label;
    image = args.image;
    fatyield = args.fat;
    proteyield = args.protein;
    carbsyield = args.carbs;
    sugaryield = args.sugar;
  caloriesyield = args.protein;
  sodiumyield = args.sodium;
    //operaciones

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detalles comida'),
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
                        "Registraste:",
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
                        'Tamaño de la Porciones: (' +
                            (args.quantity).toStringAsFixed(0) +
                            ')',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 2,
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
                        
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Calorias totales: ' +
                            (args.calories).toStringAsFixed(2),
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
                                Text(yields.toStringAsFixed(0) +
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
                                Text(yields.toStringAsFixed(0) +
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
                                Text(yields.toStringAsFixed(0) +
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
                                Text(yields.toStringAsFixed(0) +
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
                                Text(yields.toStringAsFixed(0) +
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

 
}



