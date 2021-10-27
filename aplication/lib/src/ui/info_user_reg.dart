import 'package:flutter/material.dart';

// Define un widget de formulario personalizado
class InfoUserReg extends StatefulWidget {
  //la llave validadora
  const InfoUserReg({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _InfoUserRegState();
}

class _InfoUserRegState extends State<InfoUserReg> {
  final _formKey1 = GlobalKey<FormState>();
  final txtname = TextEditingController();
  final txtsurname = TextEditingController();
  final txtage = TextEditingController();

  final formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paso 2:'),
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
                    "¡Cuentanos un poco más de ti!",
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
                      return 'Ingresa tu nombre';
                    }
                    if (value.length < 3) {
                      return 'Ingresa un nombre real ';
                    }
                    return null;
                  },
                  controller: txtname,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    labelText: 'Nombre:',
                    prefixIcon: Icon(Icons.verified_user),
                  ),
                ),

                SizedBox(height: 15),
                //textfield 2
                TextFormField(
                  validator: (value) {
                    if (value == null || value == "" || value.isEmpty) {
                      return 'Ingresa tus apellidos';
                    }
                    if (value.length <= 8) {
                      return 'Ingresa tu apellido mayor a 8 caracteres';
                    }
                    return null;
                  },
                  controller: txtsurname,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    labelText: 'Apellidos',
                    prefixIcon: Icon(Icons.verified_user),
                  ),
                ),
                //espacio entre el textfield y el botón
                SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value == null || value == "" || value.isEmpty) {
                      return 'Ingresa tu edad';
                    }
                    return null;
                  },
                  controller: txtage,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    labelText: 'Edad',
                    prefixIcon: Icon(Icons.verified_user),
                  ),
                ),
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
                          _siguientepage();
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

  void _siguientepage() {
    if (_formKey1.currentState!.validate()) {
      Navigator.pushNamed(context, '/infousercalories');
    }
  }
}
