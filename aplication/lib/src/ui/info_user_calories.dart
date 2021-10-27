import 'package:flutter/material.dart';

// Define un widget de formulario personalizado
class InfoUserCalories extends StatefulWidget {
  //la llave validadora
  const InfoUserCalories({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _InfoUserCaloriesState();
}

class _InfoUserCaloriesState extends State<InfoUserCalories> {
  final _formKey1 = GlobalKey<FormState>();
  final txtpeso = TextEditingController();
  final _txtfisico = GlobalKey<FormState>();
  final _dropdowngener = GlobalKey<FormState>();
  final _txtaltura = TextEditingController();

  double _value = 1.2;

  String dropdownvalue = 'Seleccione su sexo';
  List<String> items = <String>[
    'Seleccione su sexo',
    'Masculino',
    'Femenino',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paso 3:'),
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
                SizedBox(height: 30),
                Container(
                  child: Text(
                    "¡Por ultimo, te ayudamos a controlar tus calorias!",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.green.shade800,
                        decoration: TextDecoration.none),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32),
                ),
                SizedBox(height: 35),

                //textfiel 1
                //agregar un drop down
                Container(
                  child: DropdownButton<String>(
                    key: _dropdowngener,
                    value: dropdownvalue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurple,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  width: 250.0,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return 'Ingresa tu peso';
                      }
                      return null;
                    },
                    controller: txtpeso,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      labelText: 'Peso(Kg):',
                      prefixIcon: Icon(Icons.monitor_weight),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  width: 250.0,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value == "" || value.isEmpty) {
                        return 'Ingresa tu estatura en cm';
                      }
                      if (value.length <= 2) {
                        return 'Ingresa tu estatura en cm ej: 186';
                      }
                      return null;
                    },
                    controller: _txtaltura,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      labelText: 'Estatura(Cm)',
                      prefixIcon: Icon(Icons.height_outlined),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 330.0,
                  child: Column(children: <Widget>[
                    Text("Nivel de actividad fisica",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          key: _txtfisico,
                          value: 1.2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = 1.2;
                            });
                          },
                        ),
                        SizedBox(width: 10.0),
                        Text("No hago nada de ejercicio"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1.375,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = 1.375;
                            });
                          },
                        ),
                        SizedBox(width: 10.0),
                        Text("Ejercicio de 1 a 3 veces por semana"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1.55,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = 1.55;
                            });
                          },
                        ),
                        SizedBox(width: 10.0),
                        Text("Ejercicio de 3 a 5 veces por semana"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1.725,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = 1.725;
                            });
                          },
                        ),
                        SizedBox(width: 10.0),
                        Text("Ejercicio de 6 a 7 veces por semana"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1.9,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = 1.9;
                            });
                          },
                        ),
                        SizedBox(width: 10.0),
                        Text("Entrenamientos de más de 4 horas diarias"),
                      ],
                    ),
                  ]),
                ),

                SizedBox(height: 30),
                //botón
                Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          Navigator.pushNamed(context, '/splashloading');
                          // Navigator.pushNamed(context, '/consumo',arguments: datosArguments(myController.text,myControllernum2.text));
                        },
                        color: Colors.green.shade600,
                        child: Text('Registrarme',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ]),

                SizedBox(height: 20),
              ],
            )),
          )),
    );
  }

  void _iniciarsesion() {
    if (_formKey1.currentState!.validate()) {
      Navigator.pushNamed(context, '/splashloading');
    }
  }
}
