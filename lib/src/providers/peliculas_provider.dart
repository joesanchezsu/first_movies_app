import 'package:http/http.dart' as http;
import 'package:movies_app/src/models/pelicula_model.dart';
import 'dart:convert';

class PeliculasProvider {
  String _apikey = '838a86703fda86f62a9699644969458f';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }
}
