import 'package:flutter/material.dart';

import '../widgets/main_card_widget.dart';

class CoursesScreen extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      'title': 'Fundamentals of programming 1',
    },
    {
      'title': 'Information System',
    },
    {
      'title': 'Operating System',
    },
    {
      'title': 'DataBase 1',
    },
    {
      'title': 'Network 1',
    },
    {
      'title': 'Network Security',
    },
    {
      'title': ' Introduction to AI',
    },
    {
      'title': 'Data Science',
    },
  ];

  CoursesScreen({super.key});

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
                    'Courses',
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
              padding: const EdgeInsets.all(20),
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
                  const Center(),
                  const SizedBox(height: 16),
                  ListView.separated(
                    separatorBuilder: (ctx, i) => const SizedBox(height: 10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      final course = courses[index];
                      return MainCardWidget(
                        title: course["title"] ?? "",
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
