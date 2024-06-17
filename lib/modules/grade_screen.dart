import 'package:ahramcanadianuni/modules/course_screen.dart';
import 'package:ahramcanadianuni/modules/profile_screen.dart';
import 'package:ahramcanadianuni/modules/recommendation_screen.dart';
import 'package:ahramcanadianuni/widgets/main_card_widget.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GradeScreen(),
    );
  }
}

class GradeScreen extends StatelessWidget {
  final List<Map<String, String>> grades = [
    {
      'title': 'Introdution to Cs',
    },
    {
      'title': 'Fundamentals of programming |',
    },
    {
      'title': 'Fundamentals of programming ||',
    },
    {
      'title': 'Data Structures',
    },
    {
      'title': 'Algorithms',
    },
    {
      'title': 'Calculus ||',
    },
    {
      'title': 'Probability',
    },
    {
      'title': 'Data Science',
    },
    {
      'title': 'Introduction to AI',
    },
    {
      'title': 'Computer Organization',
    },
    {
      'title': 'Discrete Mathematics ',
    },
    {
      'title': 'Computer Graphics',
    },
    {
      'title': 'Logic Design',
    },
    {
      'title': 'Data Communications',
    },
    {
      'title': 'Network |',
    },
    {
      'title': 'Security',
    },
    {
      'title': 'Software & System Tools',
    },
    {
      'title': 'Management',
    },
    {
      'title': 'Information System',
    },
    {
      'title': 'DataBase |',
    },
    {
      'title': 'Software Engineering |',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA3A8B7),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Course Grade',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        'assets/images/ImageHandler.png',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choice your course',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                      separatorBuilder: (x, index) =>
                          const SizedBox(height: 10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: grades.length,
                      itemBuilder: (context, index) {
                        final course = grades[index];
                        return MainCardWidget(
                          title: (course['title'] ?? ""),
                          isGradesScreen: true,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CoursesScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GradeScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RecommendationScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
      ),
    );
  }
}
