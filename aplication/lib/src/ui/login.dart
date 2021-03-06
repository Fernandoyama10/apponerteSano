import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:apponertesano/src/resources/facebook_login_result.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';
import 'package:apponertesano/src/model/user.dart';
import 'package:flutter/cupertino.dart';

// Define un widget de formulario personalizado
class Login extends StatefulWidget {
  //la llave validadora
  const Login({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final txtemail = TextEditingController();
  final txtpassword = TextEditingController();

  final formkey = new GlobalKey<FormState>();
  //String _usuario;
  // String _contra;
  @override
  void initState() {
    super.initState();
    //Determine if the user is authenticated.
  }

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    txtemail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //primer elemento del listview
                  SizedBox(height: 45),
                  Hero(
                    tag: 'hero',
                    child: CircleAvatar(
                      backgroundColor: Colors.white38,
                      radius: 110.0,
                      child: Image.asset('images/applogo.png'),
                    ),
                  ),

                  SizedBox(height: 25),
                  //textfiel 1
                  TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return 'Ingresa un Correo valido';
                      }
                      if (!value.contains('@') || value.length <= 8) {
                        return 'Ingresa el formato correcto "@" o mayor de 5 caracteres';
                      }
                      return null;
                    },
                    controller: txtemail,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      labelText: 'Email: ',
                      prefixIcon: Icon(Icons.supervised_user_circle),
                    ),
                  ),

                  SizedBox(height: 15),
                  //textfield 2
                  TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return 'Ingresa una contrase??a';
                      }
                      if (value.length <= 8) {
                        return 'Ingresa una contrase??a mayor a 8 caracteres';
                      }
                      return null;
                    },
                    controller: txtpassword,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      labelText: 'Contrase??a',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                  //espacio entre el textfield y el bot??n
                  SizedBox(height: 20),
                  //bot??n
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    minWidth: 200.0,
                    height: 45.0,
                    onPressed: () {
                      _iniciarsesion();
                    },
                    color: Colors.green[400],
                    child: Text('Iniciar Sesi??n',
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '??No tienes cuenta?',
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
                      Navigator.pushNamed(context, '/registeruser');
                      // Navigator.pushNamed(context, '/consumo',arguments: datosArguments(myController.text,myControllernum2.text));
                    },
                    color: Colors.lightBlueAccent[400],
                    child: Text('Registrate',
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 18),
                  loginUI(),
                ],
              ),
            ),
          )),
    );
  }

  loginUI() {
    return Consumer<FacebookSignInController>(builder: (context, model, child) {
      if (model.userData != null) {
        return Center(
          child: loggedInUI(model),
        );
      } else {
        return loginControls(context);
      }
    });
  }

  loggedInUI(FacebookSignInController model) {
    Timer(
        Duration(seconds: -1),
        () => Navigator.of(context).pushReplacementNamed('/splashloadingFB',
            arguments: UserDat(
              model.userData!["email"].toString(),
              model.userData!["name"].toString(),
              model.userData!["id"].toString(),
            )));
  }

  loginControls(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset(
              "images/fb.png",
              width: 250,
            ),
            onTap: () {
              Provider.of<FacebookSignInController>(context, listen: false)
                  .login();
            },
          )
        ],
      ),
    );
  }

  void _iniciarsesion() {
    if (_formKey.currentState!.validate()) {
      Future<List<Usuario>> listapost = verifyLogin(context, txtemail.text);
    }
  }

  Future<List<Usuario>> verifyLogin(BuildContext context, String email) async {
    final url = Uri.parse(
        'http://apiapponertesano.azurewebsites.net/api/logindata/$email');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<Usuario> lista = parsePost(response.body);
      if (lista.length > 0) {
        print(lista[0].password);
        if (txtpassword.text == lista[0].password) {
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
        } else {
          _mensajeSuccess(context, 'Contrase??a incorrecta');
        }
      } else {
        _mensajeSuccess(context, 'No existe el usuario en la aplicaci??n');
      }
      return lista;
    } else {
      _mensajeSuccess(context, 'No existe conexi??n');
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  void _mensajeSuccess(BuildContext context, String texto1) {
    Dialogs.materialDialog(
        color: Colors.white,
        msg: "Intenta nuevamente",
        title: texto1,
        lottieBuilder: Lottie.asset(
          'images/19230-payment-failed.json',
          height: 25,
          width: 25,
        ),
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Aceptar',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }
}
