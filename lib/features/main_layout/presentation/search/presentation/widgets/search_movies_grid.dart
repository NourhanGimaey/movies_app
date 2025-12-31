import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/main_layout/presentation/widgets/movie_card.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';
import 'package:movies/features/main_layout/presentation/search/cubit/search_cubit.dart';
import 'package:provider/provider.dart';

class SearchMoviesGrid extends StatelessWidget {
  final List<Movies> movies;

  const SearchMoviesGrid({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: movies.length,
        controller: context.read<SearchCubit>().scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return MovieCard(
            movieId: movies[index].id ?? 0,
            mediumCoverImage: movies[index].mediumCoverImage ?? '',
            rating: movies[index].rating ?? 0.0,
          );
        },
      ),
    );
  }
}
