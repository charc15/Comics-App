import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/portada.png'),
                fit: BoxFit.cover
              )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50.0, bottom: 100.0),
                child: Center(child: Image(image: AssetImage('assets/logo.png'))),
              ),
              const Center(child: Text(
                'Bienvenid@',
                style: TextStyle(fontSize: 30.0, color: Colors.white, fontFamily: 'Marvel'),
              ),),
              const Center(child: Text(
                'A mi app de comics',
                style: TextStyle(fontSize: 20.0, color: Colors.white, fontFamily: 'Marvel'),
              ),),
              const SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color.fromARGB(255, 252, 0, 0),
                              Color.fromARGB(255, 215, 44, 44),
                              Color.fromARGB(255, 172, 65, 65),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/HomePage');
                      },
                      child: const Text('Entrar'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}