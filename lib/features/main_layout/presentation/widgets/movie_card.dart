import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_routes.dart';

class MovieCard extends StatelessWidget {
  final int movieId;
  final String mediumCoverImage;
  final double rating;
  const MovieCard({
    super.key,
    required this.mediumCoverImage,
    required this.movieId,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.movieDetailsScreen.routeName,
          arguments: movieId,
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(mediumCoverImage),
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
                    Text("$rating"),
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
