import 'dart:convert';

import 'package:flutter/material.dart';

import 'courses_api_handler.dart';

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
    return FutureBuilder<List<CourseModel>>(
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
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return ListTile(
                title: Text(course.name ?? ""),
                subtitle: Text(course.description ?? ""),
              );
            },
          );
        }
      },
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
