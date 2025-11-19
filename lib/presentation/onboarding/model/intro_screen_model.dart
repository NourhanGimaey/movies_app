import 'package:flutter/material.dart';

class IntroDetails {
  final String imagePath;
  final Color color;
  final String title;
  final String subtitle;

  const IntroDetails({
    required this.imagePath,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  static const List<IntroDetails> introDetails = [
    IntroDetails(
      imagePath: "assets/images/intro1.png",
      color: Color(0xFF084250),
      title: "Discover Movies",
      subtitle:
          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    ),
    IntroDetails(
      imagePath: "assets/images/intro2.png",
      color: Color(0xFF85210E),
      title: "Explore All Genres",
      subtitle:
          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    ),
    IntroDetails(
      imagePath: "assets/images/intro3.png",
      color: Color(0xFF4C2471),
      title: "Create Watchlists",
      subtitle:
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    ),
    IntroDetails(
      imagePath: "assets/images/intro4.png",
      color: Color(0xFF601321),
      title: "Rate, Review, and Learn",
      subtitle:
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    ),
    IntroDetails(
      imagePath: "assets/images/intro5.png",
      color: Color(0xFF2A2C30),
      title: "Start Watching Now!",
      subtitle: "",
    ),
  ];
}
