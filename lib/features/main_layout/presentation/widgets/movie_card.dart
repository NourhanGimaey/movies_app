import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_routes.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';

class MovieCard extends StatelessWidget {
  final Movies movies;
  const MovieCard({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.movieDetailsScreen.routeName,
          arguments: movies,
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(movies.largeCoverImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(80),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${movies.rating}"),
                    Icon(
                      Icons.star_rate_rounded,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
