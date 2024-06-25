import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utilities/api_endpoints.dart';

class LoginHandler {
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final headers =
          await ApiEndpoints.getHeaders(includeAuthorization: false);
      final body = jsonEncode(<String, String>{
        'userName': username,
        'password': password,
      });

      print('Request URL: ${ApiEndpoints.login}');
      print('Request Headers: $headers');
      print('Request Body: $body');

      final response = await http
          .post(
            Uri.parse(ApiEndpoints.login),
            headers: headers,
            body: body,
          )
          .timeout(
              const Duration(seconds: 20)); // Increase timeout to 20 seconds

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        String token = responseBody['jwt_token'];
        String studentId = responseBody['student_id'];
        await _saveToken(token);
        await _saveStudentId(studentId);
        print('Token: $token');
        print('Student ID: $studentId');
        return responseBody;
      } else {
        throw Exception(
            'Failed to login with status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Exception during login: $e');
      throw Exception('Failed to login: $e');
    }
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_token', token);
  }

  Future<void> _saveStudentId(String studentId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('student_id', studentId);
  }
}
