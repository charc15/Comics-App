import 'package:comicsapp/api/response_comics.dart';
import 'package:comicsapp/pages/comic_about.dart';
import 'package:comicsapp/pages/home_page.dart';
import 'package:flutter/material.dart';

class ItemComic extends StatefulWidget {
  ItemComic({
    Key? key,
    required this.comic,
  }) : super(key: key);

  final Comic comic;

  @override
  State<ItemComic> createState() => _ItemComicState(favorite: false);
}

class _ItemComicState extends State<ItemComic> {
  _ItemComicState({
    required this.favorite
    
  });
  bool favorite;

  Icon iconFavorite = const Icon(Icons.favorite_border);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: ((context) => ComicAbout(comic: widget.comic)))
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              widget.comic.getFullPoster()
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
              Color.fromARGB(0, 255, 255, 255),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.2, 0.3, 0.4, 1]
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(widget.comic.title, style: const TextStyle(color: Colors.white)),
                IconButton(
                  onPressed: () {
                    if(favorite == false){
                      favorite = true;
                      iconFavorite = const Icon(Icons.favorite);
                    } else {
                      favorite = false;
                      iconFavorite = const Icon(Icons.favorite_border);
                      listaFavoritos.add(ItemComic(comic: widget.comic));
                    }
                  },
                  icon: iconFavorite,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}