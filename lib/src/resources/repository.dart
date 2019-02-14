import 'dart:async';
import 'package:my_movies/src/resources/movie_api_provider.dart';
import 'package:my_movies/src/models/item_model.dart';
import 'package:my_movies/src/models/trailer_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
  Future<TrailerModel> fetchTrailers(int id) => moviesApiProvider.fetchTrailer(id);
}
