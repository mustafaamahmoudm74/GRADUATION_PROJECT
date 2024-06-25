import 'package:shared_preferences/shared_preferences.dart';

class ApiEndpoints {
  ApiEndpoints._();

  static Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_token');
  }

  static Future<Map<String, String>> getHeaders(
      {bool includeAuthorization = true}) async {
    String? token = await _getToken();
    final headers = {
      'x-api-key': 'XYSVDVSVSDCX2VD5533VPPTIOIOPQWDEMNI8876110Z',
      'Content-Type': 'application/json',
    };
    if (includeAuthorization && token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  static String baseUrl = 'http://khaledecho-005-site5.htempurl.com/v1/';

  static String login = '${baseUrl}users/login';
  static String signup = '${baseUrl}users';
  static String course = '${baseUrl}courses';
  static String recommendation =
      'https://id-department-3.onrender.com/department';

  static Future<Map<String, String>> getHeadersWithUserId(String userId) async {
    var headers = await getHeaders();
    headers['studentId'] = userId;
    return headers;
  }
}
