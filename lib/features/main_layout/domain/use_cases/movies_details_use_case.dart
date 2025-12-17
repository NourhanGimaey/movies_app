import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/main_layout/data/models/movie_details_model/movie_details_model.dart';
import 'package:movies/features/main_layout/domain/repositories/movies_repository.dart';

@injectable
class MoviesDetailsUseCase {
  final MoviesRepository _moviesRepository;

  const MoviesDetailsUseCase(this._moviesRepository);

  Future<Either<Failure, MovieDetailsModel>> call(
    int movieId,
    bool withImages,
    bool withCast,
  ) async {
    return _moviesRepository.getMovieDetails(movieId, withImages, withCast);
  }
}
