import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppStyles {
  static BoxDecoration get headerDecoration => BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.transparent,
            AppColors.bgLight1,
          ],
        ),
        borderRadius: BorderRadius.circular(100),
      );
}
