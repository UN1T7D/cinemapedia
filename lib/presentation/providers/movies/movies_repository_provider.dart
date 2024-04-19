import 'package:cinemapedia/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_reporsitory_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/* 
  Provider solo de lectura, es para traer el listado de películas 
  Este repositorio es inmutable
*/
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImplementation(datasource: MoviedbDatasource());
});
