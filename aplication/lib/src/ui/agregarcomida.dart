import 'package:flutter/material.dart';
import 'package:aplication/src/model/food.dart';

class AgregarPage extends StatefulWidget {
  const AgregarPage({Key? key}) : super(key: key);

  @override
  State<AgregarPage> createState() => _AgregarPageState();
}

class _AgregarPageState extends State<AgregarPage> {
  var _user;
  TextEditingController label_controller = TextEditingController();
  TextEditingController image_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GetRecipe args = ModalRoute.of(context)!.settings.arguments as GetRecipe;
    _user = args;
    label_controller.text = args.label;
    image_controller.text = args.image;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.label),
        backgroundColor: Colors.lightGreen.shade600,
        elevation: 0,
      ),
      body: Center(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            formulario(context),
          ],
        ),
      )),
      backgroundColor: Colors.lightGreen.shade600,
    );
  }

  Widget formulario(BuildContext context) {
    return Form(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Label(),
          const SizedBox(
            height: 5,
          ),
          Image(),
          const SizedBox(
            height: 5,
          ),
          ButtonSave(context)
        ],
      ),
    ));
  }

  Widget Label() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 5),
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              labelText: 'Nombre',
              labelStyle: const TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              prefixIcon: const Icon(
                Icons.text_fields,
                color: Colors.white,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
          controller: label_controller,
        ));
  }

  Widget Image() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 5),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: 'Imagen URL',
            labelStyle: TextStyle(color: Colors.white),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            prefixIcon: const Icon(
              Icons.image,
              color: Colors.white,
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        controller: image_controller,
      ),
    );
  }

  Widget ButtonSave(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      minWidth: 250.0,
      height: 60.0,
      color: Colors.white,
      child: const Text(
        'Guardar alimento',
        style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold),
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