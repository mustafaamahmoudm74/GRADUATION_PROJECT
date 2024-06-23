import 'package:flutter/material.dart';

import 'app_bottom_navigation_bar.dart';

class MainLayoutWidget extends StatelessWidget {
  final Widget child;
  final int currentIndex;

  const MainLayoutWidget({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: currentIndex,
      ),
    );
  }
}
