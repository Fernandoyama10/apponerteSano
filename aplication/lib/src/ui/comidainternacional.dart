import 'package:aplication/src/model/food.dart';
import 'package:flutter/material.dart';
import 'package:aplication/src/blocs/search_api.dart';
import 'package:aplication/src/ui/search_widget.dart';
import 'dart:async';

class ComidaInternacional extends StatefulWidget {
  const ComidaInternacional({Key? key}) : super(key: key);

  @override
  ComidaInternacionalListPageState createState() =>
      ComidaInternacionalListPageState();
}

class ComidaInternacionalListPageState extends State<ComidaInternacional> {
  List<Hits> books = [];
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
    final books = await EdamamApi.getRecipes(query);

    setState(() => this.books = books);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Busca tu platillo'),
          backgroundColor: Colors.lightGreen.shade600,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

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
        final books = await EdamamApi.getRecipes(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.books = books;
        });
      });

  Widget buildBook(Hits book) => ListTile(
        leading: Image.network(
          book.recipe!.image!,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(book.recipe!.label!),
        subtitle: Text(book.recipe!.label!),
          trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/agregarcomida',
                          arguments: GetRecipe(
                            book.recipe!.label!.toString(),
                            book.recipe!.image!.toString(),
                          ));
                    },
      );
}
