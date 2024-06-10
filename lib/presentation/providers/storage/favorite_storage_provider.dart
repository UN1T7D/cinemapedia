import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'local_storage_provider.dart';

final isFavoriteProvider = FutureProvider.family.autoDispose((ref, int movieId) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return localStorageRepository.isMovieFavorite(movieId);
});
