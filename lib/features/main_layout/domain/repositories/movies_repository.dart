import 'package:dartz/dartz.dart';
import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/main_layout/data/models/movie_details_model/movie_details_model.dart';
import 'package:movies/features/main_layout/data/models/movie_suggestion_model/movie_suggestion_model.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';

abstract interface class MoviesRepository {
  Future<Either<Failure, MoviesListModel>> getMoviesList(String genre);
  Future<Either<Failure, MoviesListModel>> searchMovies(String queryTerm);
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
    int movieId,
    bool withImages,
    bool withCast,
  );
  Future<Either<Failure, MovieSuggestionModel>> getMovieSuggestion(int movieId);
}
