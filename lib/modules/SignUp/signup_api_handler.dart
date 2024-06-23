import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utilities/api_endpoints.dart';

class SignupHandler {
  Future<Map<String, dynamic>> signup(
      String id,
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword) async {
    try {
      final response = await http
          .post(
            Uri.parse(ApiEndpoints.signup),
            headers: ApiEndpoints.headers,
            body: jsonEncode(<String, String>{
              'first_name': firstName,
              'last_name': lastName,
              'email': email,
              'student_id': id,
              'password': password,
              'confirm_password': confirmPassword,
            }),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
            'Failed to SignUp with status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Exception during SignUp: $e');
      throw Exception('Failed to SignUp: $e');
    }
  }
}
