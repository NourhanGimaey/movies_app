import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_cubit.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_state.dart';

class GenreTabs extends StatelessWidget {
  const GenreTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExploreCubit>();
    int genreIndex = 0;
    return DefaultTabController(
      length: cubit.allGenres.length,
      // initialIndex: cubit.selectedGenreIndex,
      key: ValueKey(cubit.selectedGenreIndex),
      child: Column(
        children: [
          BlocBuilder<ExploreCubit, ExploreState>(
            buildWhen: (previous, current) => current is ChangeGenre,
            builder: (context, state) {
              return TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                dividerColor: Colors.transparent,

                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                ),

                labelStyle: Theme.of(context).textTheme.bodyMedium,

                unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
                onTap: (index) {
                  cubit.onGenreChanged(index);
                  genreIndex = index;
                },
                tabs: cubit.allGenres
                    .map(
                      (genre) => Tab(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            genre,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color:
                                      genreIndex ==
                                          cubit.allGenres.indexOf(genre)
                                      ? Theme.of(
                                          context,
                                        ).colorScheme.onSecondary
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
