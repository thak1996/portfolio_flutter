import 'package:flutter/material.dart';
import 'package:portfolio_flutter/app/core/constants/texts.dart';
import 'modules/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppTexts.appName,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
