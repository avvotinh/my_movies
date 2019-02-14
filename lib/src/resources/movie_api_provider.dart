import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:my_movies/src/models/item_model.dart';
import 'package:my_movies/src/models/trailer_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'ce58126e1270646634f4a0601ded051e';
  final _baseUrl = 'https://api.themoviedb.org/3/movie';

  Future<ItemModel> fetchMovieList() async {
    print('Fetch list movies...');
    final response = await client.get('$_baseUrl/popular?api_key=$_apiKey');
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Faild to load post');
    }
  }

  Future<TrailerModel> fetchTrailer(int id) async {
    print('id: $id');
    final response = await client.get('$_baseUrl/$id/videos?api_key=$_apiKey');
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailes...');
    }
  }

}