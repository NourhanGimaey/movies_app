import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/error_handler.dart';
import 'package:movies/core/network/movies_retrofit/movies_retrofit_api_client.dart';
import 'package:movies/features/main_layout/data/data_sources/remote_data_sources/movies_remote_data_source.dart';
import 'package:movies/features/main_layout/data/models/movie_details_model/movie_details_model.dart';
import 'package:movies/features/main_layout/data/models/movie_suggestion_model/movie_suggestion_model.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';

@LazySingleton(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final MoviesRetrofitApiClient _moviesRetrofitApiClient;
  // final AuthRetrofitApiClient _authRetrofitApiClient;
  const MoviesRemoteDataSourceImpl(
    this._moviesRetrofitApiClient,
    // this._authRetrofitApiClient
  );

  @override
  Future<Either<Failure, MoviesListModel>> getMoviesList({
    String? genre,
    int? page,
    int? limit,
    String? sortBy,
  }) async {
    try {
      final response = await _moviesRetrofitApiClient.getMoviesList(
        genre,
        page,
        limit,
        sortBy,
      );
      return Right(response);
    } catch (exception) {
      return Left(ErrorHandler.handle(exception).failure);
    }
  }

  @override
  Future<Either<Failure, MoviesListModel>> searchMovies({
    required String queryTerm,
    int? page,
    int? limit,
    String? genre,
  }) async {
    try {
      final response = await _moviesRetrofitApiClient.searchMovies(
        queryTerm,
        page,
        limit,
        genre,
      );
      return Right(response);
    } catch (exception) {
      return Left(ErrorHandler.handle(exception).failure);
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails({
    required int movieId,
    bool? withImages,
    bool? withCast,
  }) async {
    try {
      final response = await _moviesRetrofitApiClient.getMovieDetails(
        movieId,
        withImages,
        withCast,
      );
      return Right(response);
    } catch (exception) {
      return Left(ErrorHandler.handle(exception).failure);
    }
  }

  @override
  Future<Either<Failure, MovieSuggestionModel>> getMovieSuggestion({
    required int movieId,
  }) async {
    try {
      final response = await _moviesRetrofitApiClient.getMovieSuggestion(
        movieId,
      );
      return Right(response);
    } catch (exception) {
      return Left(ErrorHandler.handle(exception).failure);
    }
  }
}
