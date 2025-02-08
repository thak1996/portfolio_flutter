import 'package:flutter/material.dart';
import 'package:portfolio_flutter/app/core/constants/texts.dart';
import '../../core/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      height: screenHeight - kToolbarHeight,
      margin: EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.homeText,
                style: TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whitePrimary,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 250,
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
          Image.asset(width: screenWidth / 2, AppTexts.imageTruck),
        ],
      ),
    );
  }
}
