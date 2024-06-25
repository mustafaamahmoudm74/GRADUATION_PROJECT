import 'dart:convert';

import 'package:flutter/material.dart';

import '../../widgets/main_card_widget.dart';
import 'courses_api_handler.dart';
import 'details_course_screen.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  List<CourseModel> modelCourses = const [];

  // Future getCourses() async {
  //   final result = await CourseHandler().course();
  //   result.fold(
  //     (l) {
  //       modelCourses = [];
  //       setState(() {});
  //     },
  //     (r) {
  //       modelCourses = r;
  //       print("YOUR MODEL>>>>>>>>>>$r");
  //
  //       setState(() {
  //         print("YOUR MODEL>>>>>>>>>>$r");
  //       });
  //     },
  //   );
  // }
  late Future<List<CourseModel>> futureCourses;

  @override
  void initState() {
    futureCourses = CourseHandler().getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
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
                    'assets/images/Logo.png',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 624,
              child: FutureBuilder<List<CourseModel>>(
                future: futureCourses,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No courses available'));
                  } else {
                    final courses = snapshot.data!;
                    return ListView.separated(
                      itemCount: courses.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return MainCardWidget(
                          title: course.name ?? "",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailsCourseScreen(
                                  courseName: course.name ?? "",
                                  aboutCourse: course.description ?? "",
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

CourseModel courseModelFromJson(String str) =>
    CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  final int? id;
  final String? cource_code;
  final String? name;
  final String? description;
  final dynamic files;

  CourseModel({
    this.id,
    this.cource_code,
    this.name,
    this.description,
    this.files,
  });

  CourseModel copyWith({
    int? id,
    String? cource_code,
    String? name,
    String? description,
    dynamic files,
  }) =>
      CourseModel(
        id: id ?? this.id,
        cource_code: cource_code ?? this.cource_code,
        name: name ?? this.name,
        description: description ?? this.description,
        files: files ?? this.files,
      );

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json["id"],
        cource_code: json["cource_code"],
        name: json["name"],
        description: json["description"],
        files: json["files"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cource_code": cource_code,
        "name": name,
        "description": description,
        "files": files,
      };
}
// import 'package:flutter/material.dart';
//
// import '../../widgets/main_card_widget.dart';
// import 'details_course_screen.dart';
//
// class CoursesScreen extends StatelessWidget {
//   final List<Map<String, String>> courses = [
//     {
//       'title': 'Fundamentals of programming 1',
//     },
//     {
//       'title': 'Information System',
//     },
//     {
//       'title': 'Operating System',
//     },
//     {
//       'title': 'DataBase 1',
//     },
//     {
//       'title': 'Network 1',
//     },
//     {
//       'title': 'Network Security',
//     },
//     {
//       'title': 'Introduction to AI',
//     },
//     {
//       'title': 'Data Science',
//     },
//   ];
//
//   CourseScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(24),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Courses',
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 80,
//                     height: 80,
//                     child: Image.asset(
//                       'assets/images/Logo.png',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Choose your course',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ListView.separated(
//                     separatorBuilder: (ctx, i) => const SizedBox(height: 10),
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: courses.length,
//                     itemBuilder: (context, index) {
//                       final course = courses[index];
//                       return MainCardWidget(
//                         title: course["title"] ?? "",
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DetailsCourseScreen(
//                                 courseName: course['title'] ?? "",
//                                 aboutCourse: course['title'] ?? "",
//                                 isGradesScreen: false,
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//     ;
//   }
// }
