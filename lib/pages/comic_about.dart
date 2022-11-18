import 'package:comicsapp/api/response_comics.dart';
import 'package:flutter/material.dart';

class ComicAbout extends StatelessWidget {
  const ComicAbout({super.key, required this.comic});

  final Comic comic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar()
        ],
      ),
    );
  }
}