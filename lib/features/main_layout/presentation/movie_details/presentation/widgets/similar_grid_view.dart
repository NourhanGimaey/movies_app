import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/main_layout/data/models/movie_suggestion_model/movie_suggestion_model.dart';
import 'package:movies/features/main_layout/presentation/widgets/movie_card.dart';

class SimilarGridView extends StatelessWidget {
  final List<Movies?> suggestedMovies;

  const SimilarGridView({super.key, required this.suggestedMovies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: suggestedMovies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return MovieCard(movies: suggestedMovies[index]);
      },
    );
  }
}
