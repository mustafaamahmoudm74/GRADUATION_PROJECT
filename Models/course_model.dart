// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

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
