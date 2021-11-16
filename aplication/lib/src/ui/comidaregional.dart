import 'package:apponertesano/src/model/food.dart';
import 'package:apponertesano/src/model/user.dart';
import 'package:flutter/material.dart';
import 'package:apponertesano/src/blocs/search_api.dart';
import 'package:apponertesano/src/ui/search_widget.dart';
import 'dart:async';

class BuscarRegional extends StatefulWidget {
  const BuscarRegional({Key? key}) : super(key: key);

  @override
  ComidaInternacionalListPageState createState() =>
      ComidaInternacionalListPageState();
}

class ComidaInternacionalListPageState extends State<BuscarRegional> {
  List<RecipeYucatan> recipes = [];
  String query = '';
  Timer? debouncer;
  int id_user= 0;
  String name = "";
  int initialcalories = 0;
  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final recipes = await LocalApi.getRecipes(query);

    setState(() => this.recipes = recipes);
  }

  @override
  Widget build(BuildContext context) {
            SendUserDataInfo data =
        ModalRoute.of(context)!.settings.arguments as SendUserDataInfo;
        id_user = data.id_user;
        name = data.name;
        initialcalories = data.initialCalories;
    return Scaffold(

        appBar: AppBar(
          title: Text('Busca tu alimento'),
          backgroundColor: Colors.lightGreen.shade600,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final book = recipes[index];

                  return buildBook(book);
                },
              ),
            ),
          ],
        ),
      );
  }
  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Nombre del platillo',
        onChanged: searchBook,
      );

  Future searchBook(String query) async => debounce(() async {
        final recipes = await LocalApi.getRecipes(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.recipes = recipes;
        });
      });

  Widget buildBook(RecipeYucatan hit) => ListTile(
        leading: Image.network(
          hit.image!,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(hit.food_name!),
        subtitle: Text(hit.food_name!),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, '/agregarcomida_regi',
              arguments: GetRecipeYuc(
                hit.food_name!.toString(),
                hit.image!.toString(),
                hit.quantity!.toDouble(),
                hit.tipo!.toString(),
                hit.calories!.toDouble(),
                hit.sugar!.toDouble(),
                hit.sodium!.toDouble(),
                hit.carbs!.toDouble(),
                hit.fat!.toDouble(),
                id_user,
                name,
                initialcalories,
                hit.protein!.toDouble(),
              ));
        },
      );
}
