import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';

sealed class ExploreState {}

class InitialState extends ExploreState {}

class LoadingState extends ExploreState {}

class ErrorState extends ExploreState {
  final Failure failure;
  ErrorState(this.failure);
}

class SuccessSearchState extends ExploreState {
  final MoviesListModel moviesListModel;
  SuccessSearchState(this.moviesListModel);
}
