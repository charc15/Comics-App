import 'package:comicsapp/api/response_comics.dart';
import 'package:http/http.dart' as http;

Future<List<Comic>> apiComics() async{
  String baseUrl = 'gateway.marvel.com';
  String endPoint = 'v1/public/comics';

  String ts = '1000';
  String apikey = '9d905e2487cff2061db39c16dbb96be7';
  String hash = 'f7c264e33b305bf82e814b1d71ff6576';

  var url = Uri.https(baseUrl, endPoint, {
    'ts' : ts,
    'apikey' : apikey,
    'hash' : hash
  });

  final response = await http.get(url);

  if(response.statusCode == 200){
    final responseComics = responseComicsFromMap(response.body);
    final results = responseComics.data.results;
    return results;
  } else {
    throw Exception('Error al obtener la lista de comics');
  }
}