import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_layout/domain/use_cases/search_movies_use_case.dart';
import 'package:movies/features/main_layout/presentation/search/cubit/search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final SearchMoviesUseCase _searchMoviesUseCase;

  Timer? _timer;

  SearchCubit(this._searchMoviesUseCase) : super(InitialState());

  Future<void> searchMovies(String queryTerm) async {
    _timer?.cancel();

    if (queryTerm.isEmpty) {
      emit(InitialState());
      return;
    }

    _timer = Timer(const Duration(milliseconds: 300), () async {
      emit(LoadingState());

      final result = await _searchMoviesUseCase.call(queryTerm);

      result.fold(
        (failure) => emit(ErrorState(failure)),
        (searchResponseModel) => emit(SuccessSearchState(searchResponseModel)),
      );
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
