import 'package:flutter/material.dart';

class DetailsCourseScreen extends StatelessWidget {
  final String courseName;
  final String? aboutCourse;
  final bool isGradesScreen;

  const DetailsCourseScreen({
    super.key,
    required this.courseName,
    this.aboutCourse,
    this.isGradesScreen = false,
  });

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
                children: [
                  SizedBox(
                    width: 196,
                    child: Text(
                      courseName,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 132,
                    height: 132,
                    child: Image.asset(
                      "assets/images/Logo.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 655,
              width: 500,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: isGradesScreen
                  ? null
                  : const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About this course",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "  ssss ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 64,
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "Lec 1",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 34,
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "Lec 2",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 34,
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "Lec 3",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }
}
