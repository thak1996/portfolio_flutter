import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/texts.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height - kToolbarHeight;
    final screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: screenHeight,
      width: double.maxFinite,
      constraints: BoxConstraints(minHeight: 560),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) => LinearGradient(colors: [
              AppColors.scaffoldBg.withValues(alpha: 0.6),
              AppColors.scaffoldBg.withValues(alpha: 0.6),
            ]).createShader(bounds),
            blendMode: BlendMode.srcATop,
            child: Image.asset(AppTexts.imageTruck, width: screenWidth / 2),
          ),
          SizedBox(height: 10),
          Text(
            AppTexts.homeText,
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: AppColors.whitePrimary,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 180,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  AppColors.yellowPrimary,
                ),
              ),
              child: Text(
                AppTexts.homeButton,
                style: TextStyle(color: AppColors.whitePrimary),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
