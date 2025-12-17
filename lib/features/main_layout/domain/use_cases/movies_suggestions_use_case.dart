import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/main_layout/data/models/movie_suggestion_model/movie_suggestion_model.dart';
import 'package:movies/features/main_layout/domain/repositories/movies_repository.dart';

@injectable
class MoviesSuggestionsUseCase {
  final MoviesRepository _moviesRepository;

  const MoviesSuggestionsUseCase(this._moviesRepository);

  Future<Either<Failure, MovieSuggestionModel>> call(int movieId) async {
    return _moviesRepository.getMovieSuggestion(movieId);
  }
}
