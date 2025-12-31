import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';
import 'package:movies/features/main_layout/domain/use_cases/search_movies_use_case.dart';
import 'package:movies/features/main_layout/presentation/search/cubit/search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final SearchMoviesUseCase _searchMoviesUseCase;
  final ScrollController scrollController = ScrollController();

  Timer? _debounce;
  int currentPage = 1;
  String lastQuery = "";

  List<Movies> allMovies = [];

  SearchCubit(this._searchMoviesUseCase) : super(InitialState()) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          searchMovies(queryTerm: lastQuery, isLoadMore: true);
        }
      }
    });
  }
  Future<void> searchMovies({
    required String queryTerm,
    int? page,
    int? limit,
    String? genre,
    bool isLoadMore = false,
  }) async {
    if (queryTerm.isEmpty) {
      allMovies.clear();
      lastQuery = "";
      emit(InitialState());
      return;
    }

    if (isLoadMore) {
      currentPage++;
    } else {
      currentPage = 1;
      lastQuery = queryTerm;
    }

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (!isLoadMore) {
        allMovies.clear();
      }

      emit(LoadingState());

      final result = await _searchMoviesUseCase.call(
        queryTerm: queryTerm,
        page: currentPage,
        limit: limit,
        genre: genre,
      );

      result.fold((failure) => emit(ErrorState(failure)), (
        searchResponseModel,
      ) {
        emit(SuccessSearchState(searchResponseModel));
      });
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    scrollController.dispose();
    return super.close();
  }
}
