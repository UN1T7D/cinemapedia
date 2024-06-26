import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actor_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieInfoProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider).getActorsByMovie;
  return ActorsByMovieNotifier(getActors: actorsRepository);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

//Manejo de cache por eso el nombre de MovieMap
class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
