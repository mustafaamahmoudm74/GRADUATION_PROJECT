import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utilities/api_endpoints.dart';
import 'course_screen.dart';

class CourseHandler {
  // static Future<Map<String, dynamic>> course() async {
  //   try {
  //     var header = {
  //       'Authorization':
  //           'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjE2IiwibmJmIjoxNzE5MTc1MTY0LCJleHAiOjE3MTkyNjE1NjQsImlhdCI6MTcxOTE3NTE2NH0.lzmDQ609P-6smqLz5d4d4awE74MGS1ISx8qFLhs4YOo',
  //       'x-api-key': 'XYSVDVSVSDCX2VD5533VPPTIOIOPQWDEMNI8876110Z',
  //       'Content-Type': 'application/json'
  //     };
  //     final response = await http
  //         .get(
  //           Uri.parse(ApiEndpoints.course),
  //           headers: header,
  //           // body: {},
  //         )
  //         .timeout(
  //             const Duration(seconds: 10)); // Increase timeout to 10 seconds
  //
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseBody = json.decode(response.body);
  //       print(responseBody);
  //       return responseBody;
  //     } else {
  //       throw Exception(
  //           'Failed to show courses with status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print(ApiEndpoints.headers);
  //     debugPrint('Exception during login: $e');
  //     throw Exception('Failed to login: $e');
  //   }
  // }
  // Future course() async {
  //   final url =
  //       Uri.parse(ApiEndpoints.course); // Replace with the actual API endpoint
  //   final headers = {
  //     'Authorization':
  //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjE2IiwibmJmIjoxNzE5MTc1MTY0LCJleHAiOjE3MTkyNjE1NjQsImlhdCI6MTcxOTE3NTE2NH0.lzmDQ609P-6smqLz5d4d4awE74MGS1ISx8qFLhs4YOo',
  //     'x-api-key': 'XYSVDVSVSDCX2VD5533VPPTIOIOPQWDEMNI8876110Z',
  //     'Content-Type': 'application/json',
  //   };
  //
  //   try {
  //     final response = await http.get(url, headers: headers);
  //
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       print('Courses data: $data'); // Handle the response data as needed
  //     } else {
  //       print('Failed to load courses: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }
  Future<List<CourseModel>> getCourses() async {
    final url =
        Uri.parse(ApiEndpoints.course); // Replace with the actual API endpoint
    final headers = {
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIzIiwibmJmIjoxNzE5MzQwMjY0LCJleHAiOjE3MTk0MjY2NjQsImlhdCI6MTcxOTM0MDI2NH0.mp_QhhwzL0PPwVFCuOBQmaV9nABX9Kvgybrn-InvaI4',
      'x-api-key': 'XYSVDVSVSDCX2VD5533VPPTIOIOPQWDEMNI8876110Z',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => CourseModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load courses: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
