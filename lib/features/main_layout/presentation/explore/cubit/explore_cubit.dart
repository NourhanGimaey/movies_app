import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';
import 'package:movies/features/main_layout/domain/use_cases/movies_by_genre_use_case.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_state.dart';

@injectable
class ExploreCubit extends Cubit<ExploreState> {
  final MoviesByGenreUseCase _moviesByGenreUseCase;

  final List<String> allGenres = [
    "Action",
    "Adventure",
    "Animation",
    "Biography",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Fantasy",
    "Film-Noir",
    "Game-Show",
    "History",
    "Horror",
    "Music",
    "Musical",
    "Mystery",
    "News",
    "Reality-TV",
    "Romance",
    "Sci-Fi",
    "Short",
    "Sport",
    "Talk-Show",
    "Thriller",
    "War",
    "Western",
  ];

  String selectedGenre = '';
  List<Movies?> allMovies = [];
  int currentPage = 1;
  bool isFetchingMore = false;
  int selectedGenreIndex = 0;

  final ScrollController scrollController = ScrollController();

  ExploreCubit(this._moviesByGenreUseCase) : super(ExploreInitialState()) {
    selectedGenre = allGenres[0];
    getMoviesList();

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          getMoviesList(isLoadMore: true);
        }
      }
    });
  }
  void onGenreChanged(int index) {
    selectedGenreIndex = index;
    selectedGenre = allGenres[index];
    emit(ChangeGenre(index: selectedGenreIndex));
    _resetPagination();
    getMoviesList();
  }

  void _resetPagination() {
    currentPage = 1;
    allMovies.clear();
  }

  Future<void> getMoviesList({bool isLoadMore = false}) async {
    if (isLoadMore) {
      if (isFetchingMore) return;
      isFetchingMore = true;
    } else {
      emit(ExploreLoadingState());
    }

    final result = await _moviesByGenreUseCase.call(
      genre: selectedGenre,
      page: currentPage,
      limit: 20,
      sortBy: "rating",
    );

    result.fold(
      (failure) {
        isFetchingMore = false;
        emit(ExploreErrorState(failure));
      },
      (moviesListModel) {
        final movies = moviesListModel.data?.movies;
        if (isLoadMore) {
          allMovies.addAll(movies ?? []);
        } else {
          allMovies = movies ?? [];
        }

        currentPage++;
        isFetchingMore = false;

        emit(ExploreSuccessState(allFilteredMovies: allMovies));
      },
    );
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
