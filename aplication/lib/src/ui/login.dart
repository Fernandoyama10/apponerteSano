import 'package:flutter/material.dart';
import 'package:aplication/src/resources/datos_login.dart';

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
                SizedBox(height: 25),
                Hero(
                  tag: 'hero',
                  child: CircleAvatar(
                    backgroundColor: Colors.white38,
                    radius: 120.0,
                    child: Image.asset('../images/applogo.png'),
                  ),
                ),

                SizedBox(height: 50),
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
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    labelText: 'Email:',
                    prefixIcon: Icon(Icons.supervised_user_circle),
                  ),
                ),

                SizedBox(height: 15),
                //textfield 2
                TextFormField(
                  validator: (value) {
                    if (value == null || value == "" || value.isEmpty) {
                      return 'Ingresa una contraseña';
                    }
                    if (value.length <= 8) {
                      return 'Ingresa una contraseña mayor a 8 caracteres';
                    }
                    return null;
                  },
                  controller: txtpassword,
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
                    _iniciarsesion();
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

  void _iniciarsesion() {
    if (_formKey.currentState!.validate()) {
      double numero1 = double.parse("DATOS ENVIADOS CORRECTAMENTE");
      setState(() => txtpassword.text = ((numero1)).toString());
    }
  }
}
