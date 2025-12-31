import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/utils/app_assets.dart';
import 'package:movies/features/main_layout/presentation/widgets/movie_card.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';

class HomeCarouselSlider extends StatefulWidget {
  final Data? data;

  const HomeCarouselSlider({super.key, required this.data});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Container(
            key: ValueKey<String>(
              widget.data?.movies?[_currentIndex]?.largeCoverImage ?? '',
            ),
            height: 650.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.data?.movies?[_currentIndex]?.largeCoverImage ?? '',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 650.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.black.withValues(alpha: 0.6),
                    AppColors.black.withValues(alpha: 0.8),
                    AppColors.black.withValues(alpha: 1),
                  ],
                  stops: const [0, 0.5, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),

        Positioned(top: 50.h, child: Image.asset(AppImages.availableNow)),

        CarouselSlider.builder(
          itemCount: widget.data?.movies?.length ?? 0,
          itemBuilder: (context, index, realIndex) => SizedBox(
            width: double.infinity,
            child: MovieCard(
              movieId: widget.data?.movies?[index]?.id ?? 0,
              mediumCoverImage:
                  widget.data?.movies?[index]?.mediumCoverImage ?? '',
              rating: widget.data?.movies?[index]?.rating ?? 0.0,
            ),
          ),
          options: CarouselOptions(
            enlargeCenterPage: true,
            enlargeFactor: 0.35,
            viewportFraction: .6,
            aspectRatio: 1.15,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),

        Positioned(bottom: 0.h, child: Image.asset(AppImages.watchNow)),
      ],
    );
  }
}
