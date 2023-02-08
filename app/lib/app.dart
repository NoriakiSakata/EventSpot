import 'package:flutter/material.dart';
import 'package:helloworld/pages/bottom_navigation_page.dart';
import 'package:helloworld/themes/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: AppColors.primaryColor,
        ),
        home: const BottomNavigationPage());
  }
}
