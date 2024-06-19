import 'package:flutter/material.dart';

import '../modules/details_course_screen.dart';

class MainCardWidget extends StatelessWidget {
  final Widget? child;
  final String? title;
  final bool isGradesScreen;

  const MainCardWidget({
    super.key,
    this.child,
    this.title,
    this.isGradesScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xCFCFD3CF),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 196,
                  child: Text(
                    title ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsCourseScreen(
                        courseName: title ?? "",
                        aboutCourse: isGradesScreen ? null : title ?? "",
                        isGradesScreen: isGradesScreen,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'View',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
