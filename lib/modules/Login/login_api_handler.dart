import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utilities/api_endpoints.dart';

class LoginHandler {
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await http
          .post(
            Uri.parse(ApiEndpoints.login),
            headers: ApiEndpoints.headers,
            body: jsonEncode(<String, String>{
              'userName': username,
              'password': password,
            }),
          )
          .timeout(
              const Duration(seconds: 10)); // Increase timeout to 10 seconds

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        ApiEndpoints.token = responseBody['jwt_token'];
        ApiEndpoints.headers['Authorization'] = 'Bearer ${ApiEndpoints.token}';
        print(responseBody['jwt_token']);
        print(ApiEndpoints.token);
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
}
