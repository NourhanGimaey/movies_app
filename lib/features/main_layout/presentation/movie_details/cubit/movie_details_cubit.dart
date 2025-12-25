import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_layout/domain/use_cases/movies_details_use_case.dart';
import 'package:movies/features/main_layout/presentation/movie_details/cubit/movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MoviesDetailsUseCase _moviesDetailsUseCase;

  MovieDetailsCubit(this._moviesDetailsUseCase) : super(InitialState());

  Future<void> getMovieDetails({required int movieId}) async {
    emit(LoadingState()); 

    final result = await _moviesDetailsUseCase.call(
      movieId: movieId,
      withImages: true,
      withCast: true,
    );
    result.fold((failure) => emit(ErrorState(failure)), (movieDetailsModel) {
      emit(SuccessState(movieDetailsModel));
    });
  }
}
