import 'package:apponertesano/src/model/food.dart';
import 'package:apponertesano/src/model/user.dart';
import 'package:flutter/material.dart';
import 'package:apponertesano/src/blocs/search_api.dart';
import 'package:apponertesano/src/ui/search_widget.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

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
  int id_user = 0;
  int fb_complete = 0;
  String name = "";
  dynamic initialcalories = 0;
  dynamic caloriasconsumidas = 0;
  dynamic id_status = 0;
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
    try {
      final recipes = await EdamamApi.getRecipes(query);

      setState(() => this.recipes = recipes);
    } catch (e) {
      _mensajeERROR(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    SendUserDataInfo data =
        ModalRoute.of(context)!.settings.arguments as SendUserDataInfo;
    id_user = data.id_user;
    name = data.name;
    initialcalories = data.initialCalories;
    fb_complete = data.fb_complete;
    caloriasconsumidas = data.caloriasconsumidas;
    id_status = data.id_status;
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
        final recipes = await EdamamApi.getRecipes(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.recipes = recipes;
        });
      });

  Widget buildBook(Hits hit) {
    return ListTile(
      leading: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: hit.recipe!.image!,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Image.asset(
                'images/page-not-found.png',
                fit: BoxFit.fill,
              )),
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
                id_user,
                name,
                initialcalories,
                caloriasconsumidas,
                id_status,
                hit.recipe!.totalNutrients!.procnt!.quantity!.toDouble(),
                fb_complete));
      },
    );
  }
     void _mensajeERROR(BuildContext context) {
    Dialogs.materialDialog(
        color: Colors.white,
        msg: "Vuelve a iniciar sesión o intenta más tarde.",
        title: "Hubo un error",
        lottieBuilder: Lottie.asset(
          'images/19230-payment-failed.json',
          height: 25,
          width: 25,
        ),
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Haz Tap en cualquier parte de la pantalla',
            iconData: Icons.close,
            color: Colors.red,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }
}
