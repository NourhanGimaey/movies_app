import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_cubit.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_state.dart';
import 'package:movies/features/main_layout/presentation/explore/presentation/widgets/explore_movies_grid.dart';
import 'package:movies/features/main_layout/presentation/explore/presentation/widgets/genre_tabs.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          GenreTabs(),
          Expanded(
            child: BlocBuilder<ExploreCubit, ExploreState>(
              builder: (context, state) {
                if (state is ExploreErrorState) {
                  return Center(child: Text(state.failure.message));
                } else if (state is ExploreSuccessState) {
                  return ExploreMoviesGrid(
                    movies: state.allFilteredMovies ?? [],
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
