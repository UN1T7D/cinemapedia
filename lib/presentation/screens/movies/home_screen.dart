import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    // es read porque esta en un metodo
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    // final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideshowMovies = ref.watch(moviesSlideshowProvider);
    if (slideshowMovies.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: [
        CustomAppBar(),
        MoviesSlideshow(movies: slideshowMovies)

        // Expanded(
        //     child: ListView.builder(
        //   itemCount: nowPlayingMovies.length,
        //   itemBuilder: (context, index) {
        //     final movie = nowPlayingMovies[index];
        //     return ListTile(
        //       title: Text(movie.title),
        //     );
        //   },
        // ))
      ],
    );
  }
}
