import 'package:flutter/material.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_state.dart';
import 'package:movies/features/main_layout/presentation/explore/presentation/widgets/explore_movies_grid.dart';
import 'package:movies/features/main_layout/presentation/explore/presentation/widgets/genre_tabs.dart';

class ExploreTabController extends StatelessWidget {
  final SuccessExploreState state;

  const ExploreTabController({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenreTabs(),
        Expanded(child: ExploreMoviesGrid(movies: state.allFilteredMovies)),
      ],
    );
  }
}
