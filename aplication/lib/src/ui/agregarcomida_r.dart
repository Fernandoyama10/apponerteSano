import 'package:aplication/src/model/food.dart';
import 'package:flutter/material.dart';

class AgregarRegional extends StatefulWidget {
  const AgregarRegional({Key? key}) : super(key: key);

  @override
  _AgregarScreenState createState() => _AgregarScreenState();
}

class _AgregarScreenState extends State<AgregarRegional> {
  double yields = 1;
  double proteyield = 0;
  double carbsyield = 0;
  double sugaryield = 0;
  double caloriesyield = 0;
  double sodiumyield = 0;
  double fatyield = 0;
  String dropdownvalue = '1';
  var items = ['1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    GetRecipe args = ModalRoute.of(context)!.settings.arguments as GetRecipe;
    //porciones
    yields = args.yield;
    //operaciones

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registrar tu alimento'),
          backgroundColor: Colors.lightGreen.shade600,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
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
                    DropdownButton(
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
                          double calories_yield = (args.calories / yields);
                          double prote_yield = (args.quantityprocnt / yields);
                          double carbs_yield = (args.quantitychocdf / yields);
                          double sugar_yield = (args.quantitychocdf / yields);
                          double sodium_yield = (args.quantityna / yields);
                          double fat_yield = (args.quantityfat / yields);

                          caloriesyield =
                              (calories_yield * double.parse(value));
                          carbsyield = (carbs_yield * double.parse(value));
                          proteyield = (prote_yield * double.parse(value));
                          sugaryield = (sugar_yield * double.parse(value));
                          sodiumyield = (sodium_yield * double.parse(value));
                          fatyield = (fat_yield * double.parse(value));
                        });
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
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          label: Text('Agregar a dieta de Hoy'),
                          onPressed: () {
                            print('Pressed');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Porciones: ' + (args.yield).toStringAsFixed(0),
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
    );
  }
}

/*

class Post {
  final String id;
  final String name;
  final String grade;
  final String group;
  final String email;

  Post({
    required this.id,
    required this.name,
    required this.grade,
    required this.group,
    required this.email,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['student_id'],
        name: json['name'],
        grade: json['grade'],
        group: json['grp'],
        email: json['email']);
  }
}

List<Post> parsePost(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

Future registrarUsu(BuildContext context, String id, String name, String grade,
    String group, String email) async {
  Map data = {
    'student_id': id,
    'name': name,
    'grade': grade,
    'grp': group,
    'email': email,
  };
  var body = json.encode(data);
  final response = await http.post(
      Uri.parse("http://apilinux.azurewebsites.net/save-user"),
      headers: {"Content-Type": "application/json"},
      body: body);
  if (response.statusCode == 200) {
    Navigator.pushReplacementNamed(context, "/");
  } else {
    throw Exception('Ni modo chavo date de baja');
  }
}
*/