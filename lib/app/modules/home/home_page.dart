import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/size.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/header_desktop.dart';
import '../widgets/header_mobile.dart';
import '../widgets/main_desktop.dart';
import '../widgets/main_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height - kToolbarHeight;
    final screenWidth = screenSize.width;
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColors.scaffoldBg,
        endDrawer:
            constraints.maxWidth >= kMinWidthDesktop ? null : DrawerMobile(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // Main
            constraints.maxWidth >= kMinWidthDesktop
                ? HeaderDesktop()
                : HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () => scaffoldKey.currentState?.openEndDrawer(),
                  ),
            constraints.maxWidth >= kMinWidthDesktop
                ? MainDesktop()
                : MainMobile(),

            // Skills
            Container(
              height: screenSize.height,
              width: double.maxFinite,
              color: Colors.red,
            ),
            // Projects
            Container(
              height: screenSize.height,
              width: double.maxFinite,
              color: Colors.green,
            ),
            // Contact
            SizedBox(
              height: screenSize.height,
              width: double.maxFinite,
            ),
          ],
        ),
      ),
    );
  }
}
