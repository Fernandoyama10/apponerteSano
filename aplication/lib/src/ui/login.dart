import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:aplication/src/resources/datos_login.dart';
import 'package:http/http.dart' as http;

// Define un widget de formulario personalizado
class Login extends StatefulWidget {
  //la llave validadora

  @override
  State<StatefulWidget> createState() => _LoginState();
}

// Define la clase State correspondiente. Esta clase contendrá los datos relacionados con
// nuestro formulario.
class _LoginState extends State<Login> {
  //no regresar

  // Crea un controlador de texto. Lo usaremos para recuperar el valor actual
  // del TextField!
  /*Ya que el TextField no tiene un ID como en Android, el texto no puede ser recuperado sobre demanda, en su lugar debe ser guardado en una variable al ser cambiado o usar un controlador. */
  final myController = TextEditingController();
  final myControllernum2 = TextEditingController();

  final formkey = new GlobalKey<FormState>();
  String _usuario;
  String _contra;

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //datos
    //datosArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      // no retroceder

      //  backgroundColor: Colors.grey[850],

      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                //primer elemento del listview
                SizedBox(height: 25),

                Hero(
                  tag: 'hero',
                  child: CircleAvatar(
                    backgroundColor: Colors.white10,
                    radius: 120.0,
                    child: Image.asset('../images/applogo.png'),
                  ),
                ),

                SizedBox(height: 50),

                //primer elemento del listview

                //textfiel 1
                TextFormField(
                  validator: (valor) =>
                      !valor.contains('@') ? 'Usuario invalido' : null,
                  onSaved: (valor) => _usuario = valor,
                  controller: myController,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    labelText: 'Usuario:',
                    prefixIcon: Icon(Icons.supervised_user_circle),
                  ),
                ),

                SizedBox(height: 15),
                //textfield 2
                TextFormField(
                  validator: (valor) =>
                      valor.length < 3 ? 'la contraseña es debil' : null,
                  onSaved: (valor) => _contra = valor,
                  controller: myControllernum2,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                //espacio entre el textfield y el botón
                SizedBox(height: 30),
                //botón
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  minWidth: 200.0,
                  height: 45.0,
                  onPressed: () {
                    final form = formkey.currentState;
                    if (form.validate()) {
                      form.save();
                      Future<List<Usuario>> listapost = fetchPost2(
                          context, myController.text, myControllernum2.text);
                    }

                    // Navigator.pushNamed(context, '/consumo',arguments: datosArguments(myController.text,myControllernum2.text));
                    return null;
                  },
                  color: Colors.green[400],
                  child: Text('Iniciar Sesión',
                      style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 7),
                Text(
                  '¿No tienes cuenta?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightGreen[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  minWidth: 200.0,
                  height: 45.0,
                  onPressed: () {
                    Navigator.pushNamed(context, '/agregar');
                    // Navigator.pushNamed(context, '/consumo',arguments: datosArguments(myController.text,myControllernum2.text));
                  },
                  color: Colors.lightBlueAccent[400],
                  child:
                      Text('Registrate', style: TextStyle(color: Colors.white)),
                ),
              ],
            )),
          )),
    );
  }
}

class Usuario {
  final int id_usu;
  final int id_salon;
  final String nombre;
  final String ape_1;
  final String ape_2;
  final String telefono;
  final int clave;
  final String escuela;
  final String usuario;
  final String contra;
  final String numero;
  final String letra;
  final int puntos;

  // final String apellidop;
  // final String apellidom;
//  final String correo;
  // final String telefono;
  // final String fechanac;

  Usuario(
      {this.id_usu,
      this.id_salon,
      this.nombre,
      this.ape_1,
      this.ape_2,
      this.telefono,
      this.clave,
      this.escuela,
      this.usuario,
      this.contra,
      this.numero,
      this.letra,
      this.puntos});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id_usu: json['id_alu'],
        id_salon: json['id_salon'],
        nombre: json['nombre'],
        ape_1: json['ape_1'],
        ape_2: json['ape_2'],
        telefono: json['telefono'],
        clave: json['clave'],
        escuela: json['escuela'],
        usuario: json['usuario'],
        contra: json['contra'],
        numero: json['numero'],
        letra: json['letra'],
        puntos: json['puntos']);
  }
}

//poder separarlo al modelo******
List<Usuario> parsePost(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}

Future<List<Usuario>> fetchPost2(
    BuildContext context, String us, String con) async {
  final response = await http.get(
      //esta muerta esta API XD
      'http://rewardcan.somee.com/Rest_usuario.asmx/Login?usuario=$us&contra=$con');
  if (response.statusCode == 200) {
    List<Usuario> lista = parsePost(response.body);
    print(lista.length);
    if (lista.length > 0) {
      Navigator.pushReplacementNamed(context, "/diseno",
          arguments: datosArguments(
              lista[0].id_usu,
              lista[0].id_salon,
              lista[0].nombre,
              lista[0].ape_1,
              lista[0].ape_2,
              lista[0].telefono,
              lista[0].clave,
              lista[0].escuela,
              lista[0].usuario,
              lista[0].contra,
              lista[0].numero,
              lista[0].letra,
              lista[0].puntos));
    } else {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Recupera el texto que el usuario ha digitado utilizando nuestro
            // TextEditingController
            content: Text("Alerta: Usuario o contraseña incorrecta"),
          );
        },
      );
    }
    return lista;
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
