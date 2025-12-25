import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/main_layout/presentation/widgets/movie_card.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';
import 'package:movies/features/main_layout/presentation/search/cubit/search_cubit.dart';
import 'package:provider/provider.dart';

class SearchMoviesGrid extends StatelessWidget {
  final Data data;
  const SearchMoviesGrid({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: data.movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return MovieCard(movies: data.movies[index]);
        },
        controller: context.read<SearchCubit>().scrollController,
      ),
    );
  }
}
