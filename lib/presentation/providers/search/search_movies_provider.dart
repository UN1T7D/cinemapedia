import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final serachedMoviesProvider =
    StateNotifierProvider<SearchedMoviesnotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);
  return SearchedMoviesnotifier(
      searchMovies: movieRepository.searchMovie, ref: ref);
});

typedef SearchMoviescallback = Future<List<Movie>> Function(String query);

class SearchedMoviesnotifier extends StateNotifier<List<Movie>> {
  final SearchMoviescallback searchMovies;
  final Ref ref;

  SearchedMoviesnotifier({required this.searchMovies, required this.ref})
      : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }
}
