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
  List<Movies?> allMovies = [];
  String lastQuery = "";
  int currentPage = 1;

  Timer? _debounce;

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
    } else if (isLoadMore) {
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

      final result = await _searchMoviesUseCase.call(
        queryTerm: queryTerm,
        page: currentPage,
        limit: 20,
        genre: genre,
      );

      result.fold((failure) => emit(ErrorState(failure)), (
        searchResponseModel,
      ) {
        final movies = searchResponseModel.data?.movies;
        if (isLoadMore) {
          allMovies.addAll(movies ?? []);
        } else {
          allMovies = movies ?? [];
        }

        currentPage++;

        emit(SuccessSearchState(allSearchedMovies: allMovies));
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
