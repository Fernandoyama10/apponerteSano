import 'package:apponertesano/src/model/user.dart';
import 'package:flutter/material.dart';

// Define un widget de formulario personalizado
class Tipocomida extends StatefulWidget {
  const Tipocomida({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DisenoState();
}

class _DisenoState extends State<Tipocomida> {
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
    SendUserDataInfo data =
        ModalRoute.of(context)!.settings.arguments as SendUserDataInfo;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipo de Comida'),
        backgroundColor: Colors.lightGreen.shade600,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Container for buttons

            SizedBox(
              height: 45,
            ),
            //Container Listview for expenses and incomes
            Container(
              child: Text(
                "• Selecciona tipo de comida •",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[900],
                    decoration: TextDecoration.none),
              ),
              padding: EdgeInsets.symmetric(horizontal: 32),
            ),

            SizedBox(
              height: 20,
            ),

            ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Comida Regional",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green[900],
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 7), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Material(
                                // neededradius: 20,
                                color: Colors.transparent,

                                child: InkWell(
                                  onTap: () {
                                      Navigator.pushNamed(context, "/comidareg",
                                        arguments: SendUserDataInfo(
                                            data.id_user,
                                            data.email,
                                            data.password,
                                            data.id_role,
                                            data.name,
                                            data.surname,
                                            data.age,
                                            data.weight,
                                            data.gender,
                                            data.height,
                                            data.name_level,
                                            data.value_level,
                                            data.initialCalories,
                                            data.fb_complete));
                                  }, // needed
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset(
                                      'images/comidayucateca.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              shrinkWrap: true,
              itemCount: 1,
              padding: EdgeInsets.all(0),
              controller: ScrollController(keepScrollOffset: false),
            ),

            //now expense
            SizedBox(
              height: 16,
            ),

            ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Comida Internacional",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green[900],
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 7), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Material(
                                // neededradius: 20,
                                color: Colors.transparent,

                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/comidainter",
                                        arguments: SendUserDataInfo(
                                            data.id_user,
                                            data.email,
                                            data.password,
                                            data.id_role,
                                            data.name,
                                            data.surname,
                                            data.age,
                                            data.weight,
                                            data.gender,
                                            data.height,
                                            data.name_level,
                                            data.value_level,
                                            data.initialCalories,
                                            data.fb_complete));
                                  }, // needed
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset(
                                      'images/comidainternacional.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              shrinkWrap: true,
              itemCount: 1,
              padding: EdgeInsets.all(0),
              controller: ScrollController(keepScrollOffset: false),
            ),

            SizedBox(
              height: 16,
            ),

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
