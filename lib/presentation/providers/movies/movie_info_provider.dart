import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final fetcMovieInfo = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifier(getMovie: fetcMovieInfo);
});

typedef GetMovieCallback = Future<Movie> Function(String movieId);

//Manejo de cache por eso el nombre de MovieMap
class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(movieId) async {
    if (state[movieId] != null) return;
    print('ssss');
    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
