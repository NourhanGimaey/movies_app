import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';

sealed class HomeState {}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class ErrorState extends HomeState {
  final Failure failure;
  ErrorState(this.failure);
}

class SuccessState extends HomeState {
  final MoviesListModel moviesListModel;
  SuccessState(this.moviesListModel);
}
