import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_layout/domain/use_cases/movies_list_use_case.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_state.dart';

@injectable
class ExploreCubit extends Cubit<ExploreState> {
  final MoviesListUseCase _moviesListUseCase;
  final ScrollController scrollController = ScrollController();

  int currentPage = 1;

  ExploreCubit(this._moviesListUseCase) : super(InitialState()) {
    getMoviesList();

    // scrollController.addListener(() {
    //   if (scrollController.position.atEdge) {
    //     bool isTop = scrollController.position.pixels == 0;
    //     if (!isTop) {
    //       getMoviesList(isLoadMore: true);
    //     }
    //   }
    // });
    // ();
  }

  Future<void> getMoviesList({
    String? genre,
    int? page,
    int? limit,
    String? sortBy,
    bool isLoadMore = false,
  }) async {
    // if (isLoadMore) {
    //   currentPage++;
    // } else {
    //   currentPage = 1;
    emit(LoadingState());
    // }

    final result = await _moviesListUseCase.call(
      genre: genre,
      page: currentPage,
      limit: limit,
      sortBy: sortBy,
    );

    result.fold((failure) => emit(ErrorState(failure)), (exploreMoviesList) {
      emit(SuccessSearchState(exploreMoviesList));
    });
  }
}
