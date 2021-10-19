import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:prueba_login/src/paginas/login.dart';
import 'package:aplication/src/blocs/loader_animator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 6),
        () => Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("../images/fondo3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            '../images/applogo1.png',
            width: 300.0,
            height: 230,
          ),
          SizedBox(height: 125),
          Loading(
            radius: 15.0,
            dotRadius: 6.0,
          )
        ],
      ),
    );
  }
}
