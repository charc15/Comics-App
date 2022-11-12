import 'package:comicsapp/api/response_comics.dart';
import 'package:flutter/material.dart';

class ItemComic extends StatelessWidget {
  const ItemComic({
    Key? key,
    required this.comic
  }) : super(key: key);

  final Comic comic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image(
            image: NetworkImage(
              comic.getFullPoster()
            ),
          ),
        ),
        Text(comic.title, style: const TextStyle(fontFamily: 'Marvel', fontSize: 12),)
      ],
    );
  }
}