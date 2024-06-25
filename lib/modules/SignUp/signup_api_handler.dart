import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utilities/api_endpoints.dart';

class SignupHandler {
  Future<Map<String, dynamic>> signup({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required int roleId,
  }) async {
    try {
      final headers = await ApiEndpoints.getHeaders();
      final response = await http
          .post(
            Uri.parse(ApiEndpoints.signup),
            headers: headers,
            body: jsonEncode(<String, dynamic>{
              'first_name': firstName,
              'last_name': lastName,
              'email': email,
              'student_id': id,
              'password': password,
              'confirm_password': confirmPassword,
              'role_id': roleId
            }),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(' ${response.body}');
      }
    } catch (e) {
      debugPrint('$e');
      throw Exception('$e');
    }
  }
}
