import 'package:flutter/material.dart';
import 'package:aplication/src/UI/initial_splash.dart';
import 'package:aplication/src/UI/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  //el context tiene información del árbol widget
  Widget build(context) {
    return MaterialApp(
      //deshabiltar el banner de debuguer
      debugShowCheckedModeBanner: false,
      //creamos el texto que tendrá la aplicación y lo centramos
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
        //'/diseno': (context) => Diseno(),

        //  '/consumo2':(context)=>Consumolista(listapost: fetchPost1(_clave.toString()),),
        // '/consumo3':(context)=>Consumolista2(listapost: fetchPost2(),),
        //hace la llamada el fetch para devolcver una listra de objetos de la clase lo almacena y lo manda al constructor de la clase consumo
      },
      /*
     home: Center(
          child: Login(),
       ) , */
    );
  }
}
