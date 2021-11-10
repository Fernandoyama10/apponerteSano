import 'package:apponertesano/src/resources/facebook_login_result.dart';
import 'package:apponertesano/src/ui/agregarcomida_i.dart';
import 'package:apponertesano/src/ui/agregarcomida_r.dart';
import 'package:apponertesano/src/ui/comidainternacional.dart';
import 'package:apponertesano/src/ui/comidaregional.dart';
import 'package:apponertesano/src/ui/info_user_reg.dart';
import 'package:apponertesano/src/ui/info_user_calories_reg.dart';
import 'package:apponertesano/src/ui/inicio.dart';
import 'package:apponertesano/src/ui/inicio_fb.dart';
import 'package:apponertesano/src/ui/registrar_user.dart';
import 'package:apponertesano/src/ui/splash_loading.dart';
import 'package:apponertesano/src/ui/tipocomida.dart';
import 'package:flutter/material.dart';
import 'package:apponertesano/src/UI/initial_splash.dart';
import 'package:apponertesano/src/UI/login.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  //el context tiene información del árbol widget
  Widget build(context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FacebookSignInController(),
          child: Login(),
        )
      ],
      child: MaterialApp(
        //deshabiltar el banner de debuguer
        debugShowCheckedModeBanner: false,
        //creamos el texto que tendrá la aplicación y lo centramos
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => SplashScreen(), //SplashScreen
          '/login': (context) => Login(),
          '/inicio': (context) => Diseno(),
              '/iniciofb': (context) => Diseno_fb(),
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
      ),
    );
  }
}
