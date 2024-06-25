import 'package:flutter/material.dart';

import '../modules/Courses/course_screen.dart';
import '../modules/Grades/grade_screen.dart';
import '../modules/Recommendation/recommendation_screen.dart';
import '../modules/profile_screen.dart';
import 'main_layout_widget.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const AppBottomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.lightBlue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Courses',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Grades',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Recommendation',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainLayoutWidget(
                        currentIndex: 0,
                        child: CoursesScreen(),
                      )),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainLayoutWidget(
                        currentIndex: 1,
                        child: GradesScreen(),
                      )),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainLayoutWidget(
                        currentIndex: 2,
                        child: RecommendationScreen(),
                      )),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainLayoutWidget(
                        currentIndex: 3,
                        child: ProfileScreen(
                          isAdmin: false,
                        ),
                      )),
            );
            break;
        }
      },
    );
  }
}
