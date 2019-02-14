import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:my_movies/src/models/trailer_model.dart';
import 'package:my_movies/src/resources/repository.dart';

class MovieDetailBloc {
  final _repository = Repository();
  final _id = PublishSubject<int>();
  final _trailers = BehaviorSubject<Future<TrailerModel>>();

  Function(int) get fetchTrailersById => _id.sink.add;
  Observable<Future<TrailerModel>> get movieTrailers => _trailers.stream;

  MovieDetailBloc() {
    _id.stream.transform(_itemTransformer()).pipe(_trailers);
  }

  dispose() async {
    _id.close();
    await _trailers.drain();
    _trailers.close();
  }

  _itemTransformer() {
    return ScanStreamTransformer(
      (Future<TrailerModel> trailer, int id, int index) {
        print(index);
        trailer = _repository.fetchTrailers(id);
        return trailer;
      },
    );
  }

}