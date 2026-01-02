import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/main_layout/presentation/widgets/movie_card.dart';
import 'package:movies/features/main_layout/presentation/home/cubit/home_cubit.dart';
import 'package:movies/features/main_layout/presentation/home/cubit/home_state.dart';
import 'package:movies/features/main_layout/presentation/home/presentation/widgets/home_carousel_slider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().changeGenre();
    });
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is ErrorState) {
            return Center(child: Text(state.failure.message));
          }

          if (state is SuccessState) {
            final movieData = state.moviesListModel.data;
            final movieDetails = state.moviesListModel.data!.movies;
            final cubit = context
                .read<HomeCubit>();
            return SingleChildScrollView(
              child: Column(
                children: [
                  HomeCarouselSlider(data: movieData),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cubit.currentGenre),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "See More →",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: movieDetails?.length ?? 0,
                      separatorBuilder: (context, index) => SizedBox(width: 16),
                      itemBuilder: (context, index) => SizedBox(
                        width: 150.w,
                        child: MovieCard(
                          movieId: movieDetails?[index]?.id ?? 0,
                          mediumCoverImage:
                              movieDetails?[index]?.mediumCoverImage ?? '',
                          rating: movieDetails?[index]?.rating ?? 0.0,
                        ),
                      ),
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
