import 'package:flutter/material.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_state.dart';
import 'package:movies/features/main_layout/presentation/explore/presentation/widgets/explore_movies_grid.dart';

class ExploreTabController extends StatelessWidget {
  final SuccessSearchState state;

  const ExploreTabController({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final List<Movies> moviesList =
        state.moviesListModel.data?.movies?.whereType<Movies>().toList() ?? [];

    final List<String> allGenres =
        moviesList
            .expand((movie) => movie.genres ?? <String?>[])
            .whereType<String>()
            .toSet()
            .toList()
          ..sort((a, b) => a.compareTo(b));

    return DefaultTabController(
      length: allGenres.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            dividerColor: Colors.transparent,

            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(16),
            ),

            labelColor: Theme.of(context).colorScheme.secondary,
            labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),

            unselectedLabelColor: Theme.of(context).colorScheme.onSecondary,
            unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.secondary),

            tabs: allGenres.map((genre) => _genreTab(context, genre)).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: allGenres.map((selectedGenre) {
                final filteredMovies = moviesList
                    .where(
                      (movie) => movie.genres?.contains(selectedGenre) ?? false,
                    )
                    .toList();

                return ExploreMoviesGrid(movies: filteredMovies);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _genreTab(BuildContext context, String genre) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
        ),
        child: Text(genre, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
