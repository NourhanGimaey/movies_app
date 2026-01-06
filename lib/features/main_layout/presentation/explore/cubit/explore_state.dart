import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';

sealed class ExploreState {}

class ExploreInitialState extends ExploreState {}

class ExploreLoadingState extends ExploreState {}

class ExploreErrorState extends ExploreState {
  final Failure failure;
  ExploreErrorState(this.failure);
}

class ExploreSuccessState extends ExploreState {
  final List<Movies?>? allFilteredMovies;

  ExploreSuccessState({required this.allFilteredMovies});
}

class ChangeGenre extends ExploreState {
  final int index;
  ChangeGenre({required this.index});
}
