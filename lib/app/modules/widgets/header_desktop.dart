import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/nav_items.dart';
import '../../core/styles/style.dart';
import 'site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.maxFinite,
      decoration: AppStyles.headerDecoration,
      child: Row(
        children: [
          SiteLogo(),
          const Spacer(),
          for (var i = 0; i < navItems.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  navItems[i],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whitePrimary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
