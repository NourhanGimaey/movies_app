import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/features/main_layout/data/models/movie_details_model/movie_details_model.dart';

class CustomRow extends StatelessWidget {
  final Movie? movieDetails;
  const CustomRow({super.key, this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 124.w,
          height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.grey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.secondary,
                size: 28.w,
              ),
              SizedBox(width: 8),
              Text(
                movieDetails?.likeCount?.toString() ?? "0",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),

        Container(
          width: 124.w,
          height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.grey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.watch_later,
                color: Theme.of(context).colorScheme.secondary,
                size: 28.w,
              ),
              SizedBox(width: 8),
              Text(
                movieDetails?.runtime?.toString() ?? "0",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),

        Container(
          width: 124.w,
          height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.grey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star_rounded,
                color: Theme.of(context).colorScheme.secondary,
                size: 32.w,
              ),
              SizedBox(width: 8),
              Text(
                movieDetails?.rating?.toString() ?? "0.0",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
