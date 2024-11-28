import 'package:flutter/material.dart';

class ResposiveLayout extends StatelessWidget {
  final Widget largeScreen;
  final Widget smallScreen;

  const ResposiveLayout({super.key, required this.largeScreen,required this.smallScreen});

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 750;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 750;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 750) {
          return largeScreen;
        } 
        else {
          return smallScreen;
        }
      },
    );
  }
}