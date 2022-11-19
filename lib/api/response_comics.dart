import 'dart:convert';

ResponseComics responseComicsFromMap(String str) =>
ResponseComics.fromMap(json.decode(str));

class ResponseComics {
  ResponseComics({
    required this.code,
    required this.status,
    required this.data,
  });

  int code;
  String status;
  Data data;

  factory ResponseComics.fromMap(Map<String, dynamic> json) => ResponseComics(
    code: json["code"],
    status: json["status"],
    data: Data.fromMap(json["data"]),
  );
}

//Objeto que contendra los resultados que es el arreglo de comics
class Data {
  Data({
    required this.results,
  });

  List<Comic> results;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    results: List<Comic>.from(json["results"].map((x) => Comic.fromMap(x))),
  );
}

//Objeto para manejar el comic
class Comic {
  Comic({
    required this.title,
    required this.poster,
    this.description  = "",
    required this.pageCount,
    required this.price
  });

  String title;
  PosterImage poster;
  String ?description;
  int pageCount;
  double price;

  factory Comic.fromMap(Map<String, dynamic> json) => Comic(
    title: json["title"],
    poster: PosterImage.fromMap(json["thumbnail"]),
    description: json["description"],
    pageCount: json["pageCount"],
    price: json["prices"][0]["price"]
  );
  getFullPoster() {
    return '${poster.path}.jpg';
  }
}

//Objeto para manejar la imagen
class PosterImage {
  PosterImage({
    required this.path,
  });
  String path;
  factory PosterImage.fromMap(Map<String, dynamic> json) => PosterImage(
    path: json["path"],
  );
}