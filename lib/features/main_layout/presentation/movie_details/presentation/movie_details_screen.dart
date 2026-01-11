import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/widgets/app_elevated_button.dart';
import 'package:movies/features/main_layout/presentation/movie_details/cubit/movie_details_cubit.dart';
import 'package:movies/features/main_layout/presentation/movie_details/cubit/movie_details_state.dart';
import 'package:movies/features/main_layout/presentation/movie_details/presentation/widgets/cast_container.dart';
import 'package:movies/features/main_layout/presentation/movie_details/presentation/widgets/custom_row.dart';
import 'package:movies/features/main_layout/presentation/movie_details/presentation/widgets/genre_container.dart';
import 'package:movies/features/main_layout/presentation/movie_details/presentation/widgets/movie_info_stack.dart';
import 'package:movies/features/main_layout/presentation/movie_details/presentation/widgets/movie_screenshots_widget.dart';
import 'package:movies/features/main_layout/presentation/movie_details/presentation/widgets/similar_grid_view.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context)!.settings.arguments as int;
    context.read<MovieDetailsCubit>().getMovieData(movieId: movieId);
    return Scaffold(
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is ErrorState) {
            return Center(child: Text(state.failure.message));
          }
          if (state is SuccessState) {
            final movieDetails = state.movieDetailsModel!.data?.movie;
            final suggestedMovies =
                state.movieSuggestionModel?.data?.movies ?? [];
            return SingleChildScrollView(
              child: Column(
                children: [
                  MovieInfoStack(movieDetails: state.movieDetailsModel),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16.h,
                      children: [
                        AppElevatedButton(
                          onPress: () {},
                          text: "Watch",
                          backgroundColor: Theme.of(context).colorScheme.error,
                          textColor: Theme.of(context).colorScheme.onError,
                        ),
                        CustomRow(movieDetails: movieDetails),
                        Text(
                          "Screenshots",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        MovieScreenshotsWidget(
                          imageUrl: movieDetails?.largeScreenshotImage1 ?? '',
                        ),
                        MovieScreenshotsWidget(
                          imageUrl: movieDetails?.largeScreenshotImage2 ?? '',
                        ),
                        MovieScreenshotsWidget(
                          imageUrl: movieDetails?.largeScreenshotImage3 ?? '',
                        ),
                        Text(
                          "Similar",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SimilarGridView(suggestedMovies: suggestedMovies),
                        Text(
                          "Summary",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(movieDetails?.descriptionFull ?? ''),
                        Text(
                          "Cast",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Column(
                          children:
                              movieDetails?.cast?.map((castMember) {
                                if (castMember == null) {
                                  return const SizedBox.shrink();
                                }
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  child: CastContainer(cast: castMember),
                                );
                              }).toList() ??
                              [],
                        ),
                        Text(
                          "Genre",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Wrap(
                          spacing: 16.w,
                          runSpacing: 16.h,
                          children:
                              movieDetails?.genres?.map((genre) {
                                return GenreContainer(genre: genre ?? '');
                              }).toList() ??
                              [],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
