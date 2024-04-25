import 'package:cinemapedia/infraestructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/* 
  Provider solo de lectura, es para traer el listado de películas 
  Este repositorio es inmutable
*/
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDBDatasource());
});
