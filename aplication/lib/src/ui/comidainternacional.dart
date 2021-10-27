import 'package:aplication/src/model/food.dart';
import 'package:flutter/material.dart';
import 'package:aplication/src/blocs/search_api.dart';
import 'package:aplication/src/ui/search_widget.dart';
import 'dart:async';

class BuscarInternacional extends StatefulWidget {
  const BuscarInternacional({Key? key}) : super(key: key);

  @override
  ComidaInternacionalListPageState createState() =>
      ComidaInternacionalListPageState();
}

class ComidaInternacionalListPageState extends State<BuscarInternacional> {
  List<Hits> recipes = [];
  String query = '';
  Timer? debouncer;

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
    final recipes = await EdamamApi.getRecipes(query);

    setState(() => this.recipes = recipes);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Nombre del platillo',
        onChanged: searchBook,
      );

  Future searchBook(String query) async => debounce(() async {
        final recipes = await EdamamApi.getRecipes(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.recipes = recipes;
        });
      });

  Widget buildBook(Hits hit) => ListTile(
        leading: Image.network(
          hit.recipe!.image!,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(hit.recipe!.label!),
        subtitle: Text(hit.recipe!.label!),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, '/agrega_inter',
              arguments: GetRecipe(
                hit.recipe!.label!.toString(),
                hit.recipe!.image!.toString(),
                hit.recipe!.yield!.toDouble(),
                hit.recipe!.calories!.toDouble(),
                hit.recipe!.totalNutrients!.sugar!.quantity!.toDouble(),
                hit.recipe!.totalNutrients!.na!.quantity!.toDouble(),
                hit.recipe!.totalNutrients!.chocdf!.quantity!.toDouble(),
                hit.recipe!.totalNutrients!.fat!.quantity!.toDouble(),
                hit.recipe!.totalNutrients!.procnt!.quantity!.toDouble(),
              ));
        },
      );
}
