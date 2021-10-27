import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:prueba_login/src/paginas/login.dart';

class SplashLoading extends StatefulWidget {
  @override
  _SplashLoadingState createState() => _SplashLoadingState();
}

class _SplashLoadingState extends State<SplashLoading> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed('/inicio'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/applogo1.png',
            width: 320.0,
            height: 250,
          ),
          SizedBox(height: 65),
          Container(
            child: Text(
              "Estamos calculando tus calorias...",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.green.shade800,
                  decoration: TextDecoration.none),
            ),
          ),
          SizedBox(height: 30),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
