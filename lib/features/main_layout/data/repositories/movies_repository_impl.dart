import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/connectivity_checker.dart';
import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/main_layout/data/data_sources/remote_data_sources/movies_remote_data_source.dart';
import 'package:movies/features/main_layout/data/models/movie_details_model/movie_details_model.dart';
import 'package:movies/features/main_layout/data/models/movie_suggestion_model/movie_suggestion_model.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';
import 'package:movies/features/main_layout/domain/repositories/movies_repository.dart';

@LazySingleton(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource _moviesRemoteDataSource;

  MoviesRepositoryImpl(this._moviesRemoteDataSource);

  final Failure _noInternetConnection = DataSource.noInternetConnection.failure;

  @override
  Future<Either<Failure, MoviesListModel>> getMoviesList({
    String? genre,
    int? page,
    int? limit,
    String? sortBy,
  }) async {
    if (await ConnectivityChecker.checkInternetConnection()) {
      return _moviesRemoteDataSource.getMoviesList(
        genre: genre,
        page: page,
        limit: limit,
        sortBy: sortBy,
      );
    } else {
      return Left(_noInternetConnection);
    }
  }

  @override
  Future<Either<Failure, MoviesListModel>> searchMovies({
    required String queryTerm,
    int? page,
    int? limit,
    String? genre,
  }) async {
    if (await ConnectivityChecker.checkInternetConnection()) {
      return _moviesRemoteDataSource.searchMovies(
        queryTerm: queryTerm,
        page: page,
        limit: limit,
        genre: genre,
      );
    } else {
      return Left(_noInternetConnection);
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails({
    required int movieId,
    bool? withImages,
    bool? withCast,
  }) async {
    if (await ConnectivityChecker.checkInternetConnection()) {
      return _moviesRemoteDataSource.getMovieDetails(
        movieId: movieId,
        withImages: withImages,
        withCast: withCast,
      );
    } else {
      return Left(_noInternetConnection);
    }
  }

  @override
  Future<Either<Failure, MovieSuggestionModel>> getMovieSuggestion({
    required int movieId,
  }) async {
    if (await ConnectivityChecker.checkInternetConnection()) {
      return _moviesRemoteDataSource.getMovieSuggestion(movieId: movieId);
    } else {
      return Left(_noInternetConnection);
    }
  }
}
