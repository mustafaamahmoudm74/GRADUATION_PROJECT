import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        // If the server returns a 200 OK response, parse the JSON
        return json.decode(response.body);
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception(
            'Failed to login with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions thrown during the request
      debugPrint('Exception during login: $e');
      throw Exception('Failed to login: $e');
    }
  }
}
