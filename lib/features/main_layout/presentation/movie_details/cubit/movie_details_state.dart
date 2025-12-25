import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/main_layout/data/models/movie_details_model/movie_details_model.dart';

sealed class MovieDetailsState {}

class InitialState extends MovieDetailsState {}

class LoadingState extends MovieDetailsState {}

class ErrorState extends MovieDetailsState {
  final Failure failure;
  ErrorState(this.failure);
}

class SuccessState extends MovieDetailsState {
  final MovieDetailsModel movieDetailsModel;
  SuccessState(this.movieDetailsModel);
}
