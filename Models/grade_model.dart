// // To parse this JSON data, do
// //
// //     final courseModel = courseModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GradeModel GradeModelFromJson(String str) =>
//     GradeModel.fromJson(json.decode(str));
//
// String GradeModelToJson(GradeModel data) => json.encode(data.toJson());
//
// class GradeModel {
//   final String? cource_code;
//   final String? name;
//   final String? description;
//   final int? grade;
//
//   GradeModel({
//     this.cource_code,
//     this.name,
//     this.description,
//     this.grade,
//   });
//
//   GradeModel copyWith({
//     int? id,
//     String? cource_code,
//     String? name,
//     String? description,
//     dynamic grade,
//   }) =>
//       GradeModel(
//         cource_code: cource_code ?? this.cource_code,
//         name: name ?? this.name,
//         description: description ?? this.description,
//         grade: grade ?? this.grade,
//       );
//
//   factory GradeModel.fromJson(Map<String, dynamic> json) => GradeModel(
//         cource_code: json["cource_code"],
//         name: json["name"],
//         description: json["description"],
//         grade: json["grade"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "cource_code": cource_code,
//         "name": name,
//         "description": description,
//         "grade": grade,
//       };
// }
