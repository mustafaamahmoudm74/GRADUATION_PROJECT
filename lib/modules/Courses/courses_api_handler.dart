import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utilities/api_endpoints.dart';

class CourseHandler {
  static Future<Map<String, dynamic>> course() async {
    try {
      final response = await http
          .post(
            Uri.parse(ApiEndpoints.course),
            headers: ApiEndpoints.headers,
            body: jsonEncode(<String, String>{}),
          )
          .timeout(
              const Duration(seconds: 10)); // Increase timeout to 10 seconds

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        print(ApiEndpoints.headers);
        print(responseBody);
        return responseBody;
      } else {
        throw Exception(
            'Failed to show courses with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(ApiEndpoints.headers);
      debugPrint('Exception during login: $e');
      throw Exception('Failed to login: $e');
    }
  }
}
