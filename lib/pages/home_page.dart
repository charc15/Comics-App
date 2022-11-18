import 'package:flutter/material.dart';
import 'package:comicsapp/api/response_comics.dart';
import 'package:comicsapp/api/comics_api.dart';
import '../models/item_comic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceSeleccionado = 0;
  final List<Widget> _cuerpoDeIndice = <Widget>[
  FutureBuilder<List<Comic>>(
    future: apiComics(),
    builder: (context, snapshot) {
      if(snapshot.hasError){
        return Text(snapshot.error.toString());
      }
      if(!snapshot.hasData){
        return const Padding(
          padding: EdgeInsets.only(top: 220),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if(snapshot.hasData){
        final List<String> listComicsFake = List.generate(20, (int index ) => 'Comic número $index');
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: GridView.builder(
              itemCount: listComicsFake.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisExtent: 285,
                mainAxisSpacing: 5
              ),
              itemBuilder: (context, index){
                final comic = snapshot.data![index];
                return (ItemComic(comic: comic));
              },
            ),
          ),
        );
      }
      throw Exception('Error');
      },
    ),
    Column(
      children: [
        const Text('Favoritos')
      ],
    ),
    Column(
      children: [
        const Text('Mas')
      ],
    )
  ];

  void _itemSeleccionado(int indice){
    setState(() {
      _indiceSeleccionado = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Column(
        children: [
          _cuerpoDeIndice.elementAt(_indiceSeleccionado)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Mas'
          )
        ],
        currentIndex: _indiceSeleccionado,
        selectedItemColor: Colors.red,
        onTap: _itemSeleccionado,
      ),
    );
  }
}