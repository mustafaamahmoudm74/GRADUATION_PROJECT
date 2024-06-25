import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utilities/api_endpoints.dart';

class GradeHandler {
  GradeModel GradeModelFromJson(String str) =>
      GradeModel.fromJson(json.decode(str));

  String GradeModelToJson(GradeModel data) => json.encode(data.toJson());

  Future<List<GradeModel>> getGrades() async {
    final url =
        Uri.parse(ApiEndpoints.grades); // Replace with the actual API endpoint
    final headers =
        await ApiEndpoints.getHeaders(); // Use token from SharedPreferences

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => GradeModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load grades: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

class GradeModel {
  final String? cource_code;
  final String? name;
  final String? description;
  final int? grade;

  GradeModel({
    this.cource_code,
    this.name,
    this.description,
    this.grade,
  });

  GradeModel copyWith({
    String? cource_code,
    String? name,
    String? description,
    required int grade,
  }) =>
      GradeModel(
        cource_code: cource_code ?? this.cource_code,
        name: name ?? this.name,
        description: description ?? this.description,
        grade: grade ?? this.grade,
      );

  factory GradeModel.fromJson(Map<String, dynamic> json) => GradeModel(
        cource_code: json["cource_code"],
        name: json["name"],
        description: json["description"],
        grade: json["grade"],
      );

  Map<String, dynamic> toJson() => {
        "cource_code": cource_code,
        "name": name,
        "description": description,
        "grade": grade,
      };
}
