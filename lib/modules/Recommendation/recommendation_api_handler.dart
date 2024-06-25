import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utilities/api_endpoints.dart';

class RecommendationHandler {
  static Future<Map<String, dynamic>> getRecommendation(String data) async {
    try {
      final headers = await ApiEndpoints.getHeaders();
      final url = Uri.parse('${ApiEndpoints.recommendation}/$data');
      print('Request URL: $url');
      print('Request Headers: $headers');

      final response = await http
          .get(
            url,
            headers: headers,
          )
          .timeout(const Duration(seconds: 10));

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        if (responseBody is Map<String, dynamic>) {
          print('Response Body: $responseBody');
          return responseBody;
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        print('Response Body: ${response.body}');
        throw Exception(
            'Failed to show Recommendation with status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Exception during Recommendation: $e');
      throw Exception('Failed to get Recommendation: $e');
    }
  }
}
