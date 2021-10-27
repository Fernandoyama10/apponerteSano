import 'package:aplication/src/ui/agregarcomida_i.dart';
import 'package:aplication/src/ui/agregarcomida_r.dart';
import 'package:aplication/src/ui/comidainternacional.dart';
import 'package:aplication/src/ui/comidaregional.dart';
import 'package:aplication/src/ui/info_user_reg.dart';
import 'package:aplication/src/ui/info_user_calories_reg.dart';
import 'package:aplication/src/ui/inicio.dart';
import 'package:aplication/src/ui/registrar_user.dart';
import 'package:aplication/src/ui/splash_loading.dart';
import 'package:aplication/src/ui/tipocomida.dart';
import 'package:flutter/material.dart';
import 'package:aplication/src/UI/initial_splash.dart';
import 'package:aplication/src/UI/login.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

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
        '/': (context) => SplashScreen(), //SplashScreen
        '/login': (context) => Login(),
        '/inicio': (context) => Diseno(),
        '/tipocomida': (context) => Tipocomida(),
        '/registeruser': (context) => RegisterUser(),
        '/infouser': (context) => InfoUserReg(),
        '/infousercalories': (context) => InfoUserCaloriesReg(),
        '/splashloading': (context) => SplashLoading(),
        '/comidainter': (context) => BuscarInternacional(),
        '/comidareg': (context) => BuscarRegional(),
        '/agrega_inter': (context) => AgregarInternacional(),
        '/agregarcomida_regi': (context) => AgregarRegional(),
      },
      /*
     home: Center(
          child: Login(),
       ) , */
    );
  }
}
