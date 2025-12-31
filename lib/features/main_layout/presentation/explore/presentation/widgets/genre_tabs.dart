import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_cubit.dart';

class GenreTabs extends StatelessWidget {

  const GenreTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExploreCubit>();

    return DefaultTabController(
      length: cubit.allGenres.length,
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
            onTap: (index) {
              cubit.onGenreChanged(index);
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
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
