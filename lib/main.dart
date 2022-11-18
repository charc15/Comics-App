import 'package:comicsapp/pages/home_page.dart';
import 'package:comicsapp/pages/introduction.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (_) => const Intro(),
        '/HomePage' : (_) => const HomePage(),
      },
    );
  }
}