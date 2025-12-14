import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  final void Function()? onPress;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderSide;

  const AppElevatedButton({
    super.key,
    required this.onPress,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.borderSide = AppColors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderSide, width: 2),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
