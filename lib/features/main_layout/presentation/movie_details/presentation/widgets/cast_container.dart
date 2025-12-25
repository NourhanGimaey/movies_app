import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/features/main_layout/data/models/movie_details_model/movie_details_model.dart';

class CastContainer extends StatelessWidget {
  final Cast cast;

  const CastContainer({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(cast.urlSmallImage ?? '', fit: BoxFit.cover),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cast.name ?? 'Unknown',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  cast.characterName ?? 'Unknown',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
