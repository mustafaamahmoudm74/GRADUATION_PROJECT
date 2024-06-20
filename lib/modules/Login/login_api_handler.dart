import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginHandler {
  Future<Map<String, dynamic>> login(String username, String password) async {
    // Replace '192.168.1.2' with your local machine's IP address
    const apiUrl = 'http://192.168.1.2:5001/v1/users/login';

    try {
      final response = await http
          .post(
            Uri.parse(apiUrl),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'userName': username,
              'password': password,
            }),
          )
          .timeout(Duration(seconds: 10)); // Increase timeout to 10 seconds

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
      print('Exception during login: $e');
      throw Exception('Failed to login: $e');
    }
  }
}
