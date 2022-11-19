import 'package:comicsapp/api/response_comics.dart';
import 'package:flutter/material.dart';

class ComicAbout extends StatelessWidget {
  const ComicAbout({super.key, required this.comic});

  final Comic comic;

  // Constantes----------------------
  final TextStyle _titStyle = const TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _subtitStyle = const TextStyle(fontSize: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(comic.title),
              background: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  comic.getFullPoster(),
                )
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  
                },
                icon: Icon(Icons.favorite_border),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('${comic.pageCount}', style: _titStyle),
                          Text('Page Count', style: _subtitStyle)
                        ],
                      ),
                      Column(
                        children: [
                          Text('${comic.price}', style: _titStyle),
                          Text('Price', style: _subtitStyle,)
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Description', style: _titStyle,),
                        Text(comic.description.toString(), textAlign: TextAlign.center,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}