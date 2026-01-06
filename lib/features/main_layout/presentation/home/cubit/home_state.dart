import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final Failure failure;
  HomeErrorState(this.failure);
}

class HomeSuccessState extends HomeState {
  final MoviesListModel moviesListModel;
  final String genreName;

  HomeSuccessState({required this.moviesListModel, required this.genreName});
}
