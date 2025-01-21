import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/size.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/header_desktop.dart';
import '../widgets/header_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
            if (constraints.maxWidth >= kMinWidthDesktop)
              HeaderDesktop()
            else
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () => scaffoldKey.currentState?.openEndDrawer(),
              ),
            // Skills
            SizedBox(
              height: 500,
              width: double.maxFinite,
            ),
            // Projects
            Container(
              color: Colors.green,
              height: 500,
              width: double.maxFinite,
            ),
            // Contact
            SizedBox(
              height: 500,
              width: double.maxFinite,
            ),
          ],
        ),
      ),
    );
  }
}
