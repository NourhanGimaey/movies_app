import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';
import 'package:movies/features/main_layout/domain/repositories/movies_repository.dart';

@injectable
class MoviesByGenreUseCase {
  final MoviesRepository _moviesRepository;

  const MoviesByGenreUseCase(this._moviesRepository);

  Future<Either<Failure, MoviesListModel>> call({
    String? genre,
    int? page,
    int? limit,
    String? sortBy,
  }) async {
    return await _moviesRepository.getMoviesByGenre(
      genre: genre,
      page: page,
      limit: limit,
      sortBy: sortBy,
    );
  }
}
