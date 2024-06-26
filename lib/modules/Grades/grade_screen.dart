import 'package:flutter/material.dart';

import '../../widgets/dialogs.dart';
import '../../widgets/main_card_widget.dart';

class GradeScreen extends StatelessWidget {
  final List<Map<String, String>> grades = [
    {
      'title': 'Introduction to Cs',
      'grade': '85',
    },
    {
      'title': 'Fundamentals of programming |',
      'grade': '61',
    },
    {
      'title': 'Fundamentals of programming ||',
      'grade': '77',
    },
    {
      'title': 'Data Structures',
      'grade': '80',
    },
    {
      'title': 'Algorithms',
      'grade': '59',
    },
    {
      'title': 'Calculus ||',
      'grade': '54',
    },
    {
      'title': 'Probability',
      'grade': '61',
    },
    {
      'title': 'Data Science',
      'grade': '82',
    },
    {
      'title': 'Introduction to AI',
      'grade': '94',
    },
    {
      'title': 'Computer Organization',
      'grade': '90',
    },
    {
      'title': 'Discrete Mathematics ',
      'grade': '66',
    },
    {
      'title': 'Computer Graphics',
      'grade': '80',
    },
    {
      'title': 'Logic Design',
      'grade': '65',
    },
    {
      'title': 'Data Communications',
      'grade': '70',
    },
    {
      'title': 'Network |',
      'grade': '72',
    },
    {
      'title': 'Security',
      'grade': '65',
    },
    {
      'title': 'Software & System Tools',
      'grade': '97',
    },
    {
      'title': 'Management',
      'grade': '93',
    },
    {
      'title': 'Information System',
      'grade': '80',
    },
    {
      'title': 'DataBase |',
      'grade': '82',
    },
    {
      'title': 'Software Engineering |',
      'grade': '90',
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
                      'assets/images/Logo.png',
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
                    'Choose your course',
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
                        onPressed: () {
                          Dialogs.materialDialog(
                            context: context,
                            title: course['title'] ?? "Course Details",
                            msg: "Your Grade is: ${course['grade']}",
                            actionsBuilder: (context) => [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
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
