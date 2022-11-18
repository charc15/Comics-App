import 'package:comicsapp/api/response_comics.dart';
import 'package:comicsapp/pages/comic_about.dart';
import 'package:flutter/material.dart';

class ItemComic extends StatelessWidget {
  const ItemComic({
    Key? key,
    required this.comic
  }) : super(key: key);

  final Comic comic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: ((context) => ComicAbout(comic: comic)))
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              comic.getFullPoster()
            )
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(197, 36, 36, 36),
              Color.fromARGB(128, 36, 36, 36),
              Color.fromARGB(54, 36, 36, 36),
              Color.fromARGB(0, 85, 85, 85),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.2, 0.3, 0.4, 0.0]
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(comic.title, style: const TextStyle(color: Colors.white)),
          ),
        )
      ),
    );
  }
}