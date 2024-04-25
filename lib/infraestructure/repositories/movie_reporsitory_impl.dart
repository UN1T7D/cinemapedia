import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_reporsitory.dart';

class MovieRepositoryImplementation extends MoviesRepository {
  final MoviesDatasource datasource;

  MovieRepositoryImplementation({required this.datasource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return this.datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return this.datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return this.datasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return this.datasource.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return this.datasource.getMovieById(id);
  }
}
