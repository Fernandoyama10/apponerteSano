import 'package:apponertesano/src/model/food.dart';
import 'package:apponertesano/src/model/user.dart';
import 'package:flutter/material.dart';
import 'package:apponertesano/src/blocs/search_api.dart';
import 'package:apponertesano/src/ui/search_widget.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

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
  int id_user = 0;
  int fb_complete = 0;
  String name = "";
  dynamic initialcalories = 0;
  dynamic caloriasconsumidas = 0;
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
      final recipes = await LocalApi.getRecipes(query);

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
        leading: CachedNetworkImage(
            width: 60,
            height: 70,
            imageUrl: hit.image!,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Image.asset(
                  'images/page-not-found.png',
                  fit: BoxFit.fill,
                )),
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
                  caloriasconsumidas,
                  hit.protein!.toDouble(),
                  fb_complete));
        },
      );

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
            onPressed: () {},
            text: 'Haz Tap en cualquier parte de la pantalla',
            iconData: Icons.close,
            color: Colors.red,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }
}
