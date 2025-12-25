import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieScreenshotsWidget extends StatelessWidget {
  final String imageUrl;

  const MovieScreenshotsWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 168.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(imageUrl, fit: BoxFit.fitWidth),
      ),
    );
  }
}
