import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';

class MovieInfoStack extends StatelessWidget {
  const MovieInfoStack({super.key});

  @override
  Widget build(BuildContext context) {
    final movieInfo = ModalRoute.of(context)!.settings.arguments as Movies;

    return Stack(
      children: [
        Image.network(
          movieInfo.largeCoverImage,
          width: double.infinity,
          height: 650.h,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 650.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.black.withValues(alpha: 0),
                AppColors.black.withValues(alpha: 0.4),
                AppColors.black.withValues(alpha: 0.75),
                AppColors.black.withValues(alpha: .9),
              ],
              stops: const [0, 0.5, 0.75, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        SizedBox(
          height: 650.h,
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new, size: 30),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_border, size: 30),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      movieInfo.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    Text("${movieInfo.year}"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
