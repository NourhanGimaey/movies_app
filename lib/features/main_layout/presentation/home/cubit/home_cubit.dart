import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_layout/domain/use_cases/movies_list_use_case.dart';
import 'package:movies/features/main_layout/presentation/home/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final MoviesListUseCase _moviesListUseCase;

  HomeCubit(this._moviesListUseCase) : super(InitialState()) {
    getMoviesList();
  }

  Future<void> getMoviesList({
    String? genre,
    int? page,
    int? limit,
    String? sortBy,
  }) async {
    final result = await _moviesListUseCase.call(
      genre: genre,
      page: page,
      limit: limit,
      sortBy: sortBy,
    );
    result.fold((failure) => emit(ErrorState(failure)), (moviesListModel) {
      emit(SuccessState(moviesListModel));
    });
  }
}
