import 'package:flutter/material.dart';

// Define un widget de formulario personalizado
class RegisterUser extends StatefulWidget {
  //la llave validadora
  const RegisterUser({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _formKey1 = GlobalKey<FormState>();
  final txtemail = TextEditingController();
  final txtpassword = TextEditingController();

  final formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paso 1:'),
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
                SizedBox(height: 100),
                Container(
                  child: Text(
                    "¡Registra tu usuario!",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.green.shade800,
                        decoration: TextDecoration.none),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32),
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
                Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        minWidth: 200.0,
                        height: 45.0,
                        onPressed: () {
                          _registrarUser();
                          // Navigator.pushNamed(context, '/consumo',arguments: datosArguments(myController.text,myControllernum2.text));
                        },
                        color: Colors.red.shade400,
                        child: Text('Siguiente',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ]),

                SizedBox(height: 20),
              ],
            )),
          )),
    );
  }

  void _registrarUser() {
    if (_formKey1.currentState!.validate()) {
      Navigator.pushNamed(context, '/infouser');
    }
  }
}
