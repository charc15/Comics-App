import 'package:comicsapp/api/response_comics.dart';
import 'package:comicsapp/pages/comic_about.dart';
import 'package:comicsapp/pages/home_page.dart';
import 'package:flutter/material.dart';

class ItemComic extends StatefulWidget {
  ItemComic({
    Key? key,
    required this.comic,
  }) : super(key: key);

  Comic comic;

  @override
  State<ItemComic> createState() => _ItemComicState();
}

class _ItemComicState extends State<ItemComic> {
  Icon iconFavorite = const Icon(Icons.favorite_border, color: Colors.red,);
  bool favorite = false;

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
            child: Column(
              children: [
                Text(widget.comic.title, style: const TextStyle(color: Colors.white)),
                IconButton(
                  onPressed: () {
                    if(favorite == false){
                      setState(() {
                      favorite = true;
                      iconFavorite = const Icon(Icons.favorite, color: Colors.red,);   
                      listaFavoritos.add(ItemComic(comic: widget.comic));
                      });
                    } else {
                      setState(() {
                      favorite = false;
                      iconFavorite = const Icon(Icons.favorite_border, color: Colors.red,);
                      });
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

class Favorite extends StatelessWidget {
  Favorite({super.key, required this.comic});

  Comic comic;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: listaFavoritos
      ),
    );
  }
}