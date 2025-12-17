import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/api_endpoint.dart';
import 'package:movies/features/main_layout/data/models/movie_details_model/movie_details_model.dart';
import 'package:movies/features/main_layout/data/models/movie_suggestion_model/movie_suggestion_model.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_retrofit_api_client.g.dart';

@singleton
@RestApi(baseUrl: MoviesApiEndpoint.baseUrl)
abstract class MoviesRetrofitApiClient {
  @factoryMethod
  factory MoviesRetrofitApiClient(Dio dio) = _MoviesRetrofitApiClient;

  @GET(MoviesApiEndpoint.listMoviesApi)
  Future<MoviesListModel> getMoviesList(@Query("genre") String genre);

  @GET(MoviesApiEndpoint.listMoviesApi)
  Future<MoviesListModel> searchMovies(@Query("query_term") String queryTerm);

  @GET(MoviesApiEndpoint.movieDetailsApi)
  Future<MovieDetailsModel> getMovieDetails(
    @Query("movie_id") int movieId,
    @Query("with_images") bool withImages,
    @Query("with_cast") bool withCast,
  );

  @GET(MoviesApiEndpoint.movieSuggestionApi)
  Future<MovieSuggestionModel> getMovieSuggestion(
    @Query("movie_id") int movieId,
  );
}
