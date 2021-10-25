import 'package:flutter/material.dart';

// Define un widget de formulario personalizado
class ComidaRegional extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DisenoState();
}

class _DisenoState extends State<ComidaRegional> {
  // static datosArguments args;
// log aout
  //clase choice
  /*  void _select(Choice choice){
setState(() {
  switch (choice.title) {
    case 'LOG OUT':
        Navigator.pushNamed(context, '/login');
        break;
  }
});
}*/

  @override
  Widget build(BuildContext context) {
    //  args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Comida Regional'),
        backgroundColor: Colors.lightGreen.shade600,
        centerTitle: true,
      ),

      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //now expense
          ],
        ),
      ),
      // color: Colors.green[600],
    );
  }
}
/* 
class Choice{
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List <Choice> choices = const <Choice>[
  const Choice(title: 'LOG OUT', icon: Icons.power_settings_new),


];*/
