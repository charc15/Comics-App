import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Key para identificar el estado del scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Método para abrir el drawer del appbar
  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Inicio'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () { _openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      // Construcción del drawer
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30.0, left: 10.0),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Image(image: AssetImage('assets/user.png'), width: 80.0, height: 80.0,),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30.0, left: 20.0),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Usuario',
                      style: TextStyle(fontSize: 50.0, fontFamily: 'Marvel'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Comics', style: TextStyle(fontSize: 30.0, fontFamily: 'Marvel',))
            ],
          )
        ],
      ),
    );
  }
}