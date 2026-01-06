import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_layout/domain/use_cases/movies_list_use_case.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_cubit.dart';
import 'package:movies/features/main_layout/presentation/home/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final MoviesListUseCase _moviesListUseCase;
  final ExploreCubit _exploreCubit;

  String? selectedGenre;

  HomeCubit(this._moviesListUseCase, this._exploreCubit)
    : super(HomeInitialState()) {
    getRandomGenreMovies();
  }

  void getRandomGenreMovies() {
    final allGenres = _exploreCubit.allGenres;
    final randomIndex = Random().nextInt(allGenres.length);
    selectedGenre = allGenres[randomIndex];

    getMoviesList(selectedGenre: selectedGenre);
  }

  Future<void> getMoviesList({
    String? selectedGenre,
    int? page,
    int? limit,
    String sortBy = 'rating',
  }) async {
    emit(HomeLoadingState());

    final result = await _moviesListUseCase.call(
      genre: selectedGenre,
      page: page,
      limit: limit,
      sortBy: sortBy,
    );

    result.fold((failure) => emit(HomeErrorState(failure)), (moviesListModel) {
      emit(
        HomeSuccessState(
          moviesListModel: moviesListModel,
          genreName: selectedGenre ?? "Recommended",
        ),
      );
    });
  }
}
