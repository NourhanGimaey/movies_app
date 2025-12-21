import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';
import 'package:movies/features/main_layout/domain/repositories/movies_repository.dart';

@injectable
class SearchMoviesUseCase {
  final MoviesRepository _moviesRepository;

  const SearchMoviesUseCase(this._moviesRepository);

  Future<Either<Failure, MoviesListModel>> call({
    required String queryTerm,
    int? page,
    int? limit,
    String? genre,
  }) async {
    return await _moviesRepository.searchMovies(
      queryTerm: queryTerm,
      page: page,
      limit: limit,
      genre: genre,
    );
  }
}
