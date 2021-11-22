import 'dart:async';
import 'package:flutter/material.dart';

class SplashLoading extends StatefulWidget {
  @override
  _SplashLoadingState createState() => _SplashLoadingState();
}

class _SplashLoadingState extends State<SplashLoading> {
  @override
  void initState() {
    Timer(Duration(seconds: 2),
        () => Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightGreen.shade50,
              Colors.lightGreen.shade100,
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/applogo1.png',
            width: 320.0,
            height: 250,
          ),
          SizedBox(height: 3),
          Container(
            alignment: Alignment.centerRight,
            width: 300,
            child: Text(
              "Estamos guardando tus datos...",
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
