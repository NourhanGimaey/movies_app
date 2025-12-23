import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/features/main_layout/presentation/widgets/movie_card.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';

class HomeCarouselSlider extends StatelessWidget {
  final Data data;

  const HomeCarouselSlider({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: data.movies.length,
      itemBuilder: (context, index, realIndex) => SizedBox(
        width: double.infinity,
        child: MovieCard(movies: data.movies[index]),
      ),
      options: CarouselOptions(
        enlargeCenterPage: true,
        enlargeFactor: 0.35,
        viewportFraction: .6,
        aspectRatio: 1.1,
        initialPage: 0,
      ),
    );
  }
}
