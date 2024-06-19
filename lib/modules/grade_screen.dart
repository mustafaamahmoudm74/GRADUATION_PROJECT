import 'package:flutter/material.dart';

import '../widgets/main_card_widget.dart';

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

  GradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Grades',
                    style: TextStyle(
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
              padding: const EdgeInsets.all(20.0),
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
                    separatorBuilder: (x, index) => const SizedBox(height: 10),
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
    );
  }
}
