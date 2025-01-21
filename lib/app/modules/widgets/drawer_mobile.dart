import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/nav_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: AppColors.whitePrimary),
              ),
            ),
          ),
          for (var i = 0; i < navItems.length; i++)
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              titleTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whitePrimary,
              ),
              leading: Icon(navIcons[i]),
              title: Text(navItems[i]),
              onTap: () {},
            ),
        ],
      ),
    );
  }
}
