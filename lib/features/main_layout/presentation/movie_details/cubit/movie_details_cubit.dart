import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_layout/data/models/movie_details_model/movie_details_model.dart';
import 'package:movies/features/main_layout/data/models/movie_suggestion_model/movie_suggestion_model.dart';
import 'package:movies/features/main_layout/domain/use_cases/movies_details_use_case.dart';
import 'package:movies/features/main_layout/domain/use_cases/movies_suggestions_use_case.dart';
import 'package:movies/features/main_layout/presentation/movie_details/cubit/movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MoviesDetailsUseCase _moviesDetailsUseCase;
  final MoviesSuggestionsUseCase _moviesSuggestionsUseCase;

  MovieDetailsCubit(this._moviesDetailsUseCase, this._moviesSuggestionsUseCase)
    : super(InitialState());

  Future<void> getMovieData({required int movieId}) async {
    emit(LoadingState());

    final results = await Future.wait([
      _moviesDetailsUseCase.call(
        movieId: movieId,
        withImages: true,
        withCast: true,
      ),
      _moviesSuggestionsUseCase.call(movieId: movieId),
    ]);

    final detailsResult = results[0];
    final suggestionsResult = results[1];

    detailsResult.fold((failure) => emit(ErrorState(failure)), (movieDetails) {
      suggestionsResult.fold((failure) => emit(ErrorState(failure)), (
        suggestions,
      ) {
        emit(
          SuccessState(
            movieDetails as MovieDetailsModel,
            suggestions as MovieSuggestionModel,
          ),
        );
      });
    });
  }
}
